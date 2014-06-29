class PublicController < ApplicationController
  skip_before_action :authenticate_user!

  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.page(params[:page]).per(10).order(created_at: :desc)
  end
end
