require "rails_helper"

RSpec.describe AlbumArtistsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/album_artists").to route_to("album_artists#index")
    end

    it "routes to #new" do
      expect(:get => "/album_artists/new").to route_to("album_artists#new")
    end

    it "routes to #show" do
      expect(:get => "/album_artists/1").to route_to("album_artists#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/album_artists/1/edit").to route_to("album_artists#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/album_artists").to route_to("album_artists#create")
    end

    it "routes to #update" do
      expect(:put => "/album_artists/1").to route_to("album_artists#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/album_artists/1").to route_to("album_artists#destroy", :id => "1")
    end

  end
end
