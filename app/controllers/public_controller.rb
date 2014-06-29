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
    @albums = Album.where("title LIKE ?", "%#{params[:search]}%")
    @artists = Artist.where("name LIKE ?", "%#{params[:search]}%")
    @tracks = Track.where("name LIKE ?", "%#{params[:search]}%")

    if @albums.blank? && @artists.blank? && @tracks.blank?
      # @no_search
    end
  end
end
