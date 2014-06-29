class PublicController < ApplicationController
  skip_before_action :authenticate_user!

  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.page(params[:page]).per(10).order(created_at: :desc)
  end

  # GET /search
  # GET /search.json
  def search
    @albums = Album.where("title LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    @artists = Artist.where("name LIKE ? OR about LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    @tracks = Track.where("name LIKE ?", "%#{params[:search]}%")
    @search_combinde = {
      albums: @albums, 
      artists: @artists, 
      tracks: @tracks
    }

    respond_to do |format|
      format.html
      format.json { render json: @search_combinde.to_json }
      format.xml { render xml: @search_combinde.to_xml}
    end
  end
end
