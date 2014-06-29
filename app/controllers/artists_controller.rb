class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index]

  # GET /artists
  # GET /artists.json
  def index
    @artists = Artist.page(params[:page])
  end

  # GET /artists/1
  # GET /artists/1.json
  def show
    @similar_artists = get_similar_artists(@artist.name)
    @limit_artists = params[:similar_artists] ? 100 : 5
  end

  # GET /artists/new
  def new
    @artist = Artist.new
  end

  # GET /artists/1/edit
  def edit
  end

  # POST /artists
  # POST /artists.json
  def create
    @artist = Artist.new(artist_params)
    artist_picture if params[:search_online]

    respond_to do |format|
      if @artist.save
        format.html { redirect_to @artist, notice: 'Artist was successfully created.' }
        format.json { render :show, status: :created, location: @artist }
      else
        format.html { render :new }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artists/1
  # PATCH/PUT /artists/1.json
  def update
    artist_picture if params[:search_online]

    respond_to do |format|
      if @artist.update(artist_params)
        format.html { redirect_to @artist, notice: 'Artist was successfully updated.' }
        format.json { render :show, status: :ok, location: @artist }
      else
        format.html { render :edit }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1
  # DELETE /artists/1.json
  def destroy
    @artist.destroy

    respond_to do |format|
      format.html { redirect_to artists_url, notice: 'Artist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      params.require(:artist).permit(:name, :about, :picture)
    end

    def artist_picture
      picture_url = get_artist_picture(@artist.name)
      @artist.picture_from_url(picture_url) if !picture_url.blank?
    end

    # Artist picture
    def get_artist_picture(artist)
      require "net/http"
      uri = URI.parse("http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=#{CGI.escape artist}&api_key=#{ENV["LAST_FM_API_KEY"]}&format=json")
      response = Net::HTTP.get(uri)
      json = JSON.parse(response)
      return if !json["error"].blank?

      result = ''
      json_values = json.values

      if json_values.count > 0
        artist = json_values[0]
        # TODO: Loop from index 3 up if empty url returned so that we can get at least one image.
        result = { "picture_url" => artist["image"][3]["#text"] }
      end

      result["picture_url"]
    end

    # Similar artists
    def get_similar_artists(artist)
      require "net/http"
      uri = URI.parse("http://ws.audioscrobbler.com/2.0/?method=artist.getsimilar&artist=#{CGI.escape artist}&api_key=#{ENV["LAST_FM_API_KEY"]}&format=json")
      response = Net::HTTP.get(uri)
      # response.code
      # response.body
      json = JSON.parse(response)

      # redirect_to artists_path, alert: json["message"] and return
      return if !json["error"].blank?

      result = []
      json_values = json.values

      if json_values.count > 0
        artists = json_values[0]["artist"]

        if artists.instance_of?(Array)
          artists.each do |artist|
            data = {
              "name" => artist["name"],
              "picture_url" => artist["image"][0]["#text"]
            }

            result << data
          end
        end
      end

      result
    end
end
