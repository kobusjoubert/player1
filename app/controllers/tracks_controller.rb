class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]
  before_action :set_album, only: [:index, :edit]

  # GET /albums/1/tracks
  # GET /albums/1/tracks.json
  def index
    respond_to do |format|
      format.html { render partial: "index", locals: { album: @album } }
      format.json { render json: @album.tracks.to_json }
      format.xml { render xml: @album.tracks.to_xml }
    end
  end

  # # GET /albums/1/tracks/1
  # # GET /albums/1/tracks/1.json
  # def show
  # end

  # # GET /albums/1/tracks/new
  # def new
  #   @track = Track.new
  # end

  # GET /albums/1/tracks/1/edit
  def edit
  end

  # POST /albums/1/tracks
  # POST /albums/1/tracks.json
  def create
    @track = Track.new(track_params)
    @track.album_id = params[:album_id]

    respond_to do |format|
      if @track.save
        format.html { redirect_to album_path(@track.album), notice: 'Track was successfully created.' }
        format.json { render :show, status: :created, location: album_path(@track.album) }
        format.xml { render xml: @track, status: :created }
      else
        format.html { redirect_to album_path(@track.album), alert: 'Track was not added.' }
        format.json { render json: @track.errors, status: :unprocessable_entity }
        format.xml { render xml: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1/tracks/1
  # PATCH/PUT /albums/1/tracks/1.json
  def update
    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to album_path(@track.album), notice: 'Track was successfully updated.' }
        format.json { render :show, status: :ok, location: album_path(@track.album) }
        format.xml { render xml: @track, status: :updated }
      else
        format.html { redirect_to album_path(@track.album), alert: 'Track was not updated.' }
        format.json { render json: @track.errors, status: :unprocessable_entity }
        format.xml { render xml: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1/tracks/1
  # DELETE /albums/1/tracks/1.json
  def destroy
    @track.destroy

    respond_to do |format|
      format.html { redirect_to album_url(@track.album), notice: 'Track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def track_params
      params.require(:track).permit(:name, :duration, :album_id)
    end

    def set_album
      @album = Album.find(params[:album_id])
    end
end
