class AlbumArtistsController < ApplicationController
  before_action :set_album_artist, only: [:show, :edit, :update, :destroy]

  # GET /album_artists
  # GET /album_artists.json
  def index
    @album_artists = AlbumArtist.all
  end

  # GET /album_artists/1
  # GET /album_artists/1.json
  def show
  end

  # GET /album_artists/new
  def new
    @album_artist = AlbumArtist.new
  end

  # GET /album_artists/1/edit
  def edit
  end

  # POST /album_artists
  # POST /album_artists.json
  def create
    @album_artist = AlbumArtist.new(album_artist_params)

    respond_to do |format|
      if @album_artist.save
        format.html { redirect_to @album_artist, notice: 'Album artist was successfully created.' }
        format.json { render :show, status: :created, location: @album_artist }
      else
        format.html { render :new }
        format.json { render json: @album_artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /album_artists/1
  # PATCH/PUT /album_artists/1.json
  def update
    respond_to do |format|
      if @album_artist.update(album_artist_params)
        format.html { redirect_to @album_artist, notice: 'Album artist was successfully updated.' }
        format.json { render :show, status: :ok, location: @album_artist }
      else
        format.html { render :edit }
        format.json { render json: @album_artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /album_artists/1
  # DELETE /album_artists/1.json
  def destroy
    @album_artist.destroy
    respond_to do |format|
      format.html { redirect_to album_artists_url, notice: 'Album artist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album_artist
      @album_artist = AlbumArtist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_artist_params
      params.require(:album_artist).permit(:album_id, :artist_id)
    end
end
