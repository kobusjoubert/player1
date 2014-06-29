class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index]

  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.page(params[:page])
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
  end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(album_params)
    album_artists
    album_cover if params[:search_online]

    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    album_artists
    album_cover if params[:search_online]

    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:title, :description, :genre, :cover, :artists)
    end

    # There need to be at least one artist.
    def album_artists
      artist_ids = params[:album][:artists]
      artist_ids.shift

      if artist_ids.length > 0
        # Remove all artists linked to this album first.
        album_artists = AlbumArtist.where(album_id: @album)

        album_artists.each do |album_artist|
          album_artist.destroy
        end

        # Add all artists from list.
        artist_ids.each do |artist_id|
          album_artist = AlbumArtist.new(album: @album, artist_id: artist_id)
          album_artist.save
        end
      else
        # TODO: Not sure why this isn't displaying the error.
        @album.errors.add(:artists, "You need to select at least one artist.")
      end
    end

    def album_cover
      cover_url = get_album_cover(@album.title)
      @album.cover_from_url(cover_url) if !cover_url.blank?
    end

    # Album cover
    def get_album_cover(album)
      require "net/http"
      uri = URI.parse("http://ws.audioscrobbler.com/2.0/?method=album.getinfo&album=#{CGI.escape album.artist.first}&album=#{CGI.escape album}&api_key=#{ENV["LAST_FM_API_KEY"]}&format=json")
      response = Net::HTTP.get(uri)
      json = JSON.parse(response)
      return if !json["error"].blank?

      result = ''
      json_values = json.values

      if json_values.count > 0
        album = json_values[0]
        # TODO: Loop from index 3 up if empty url returned so that we can get at least one image.
        result = { "picture_url" => album["image"][3]["#text"] }
      end

      result["picture_url"]
    end
end
