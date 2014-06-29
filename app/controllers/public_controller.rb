class PublicController < ApplicationController
  skip_before_action :authenticate_user!

  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.page(params[:page]).per(10).order(created_at: :desc)

    respond_to do |format|
      format.html
      format.json { render json: @albums.to_json }
      format.xml { render xml: @albums.to_xml }
    end
  end

  # GET /search
  # GET /search.json
  def search
    @albums = Album.where("title ILIKE ? OR description ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    @artists = Artist.where("name ILIKE ? OR about ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    @tracks = Track.where("name ILIKE ?", "%#{params[:search]}%")
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
