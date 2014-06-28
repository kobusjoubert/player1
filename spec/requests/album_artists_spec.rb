require 'rails_helper'

RSpec.describe "AlbumArtists", :type => :request do
  describe "GET /album_artists" do
    it "works! (now write some real specs)" do
      get album_artists_path
      expect(response.status).to be(200)
    end
  end
end
