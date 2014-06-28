require 'rails_helper'

RSpec.describe "album_artists/new", :type => :view do
  before(:each) do
    assign(:album_artist, AlbumArtist.new(
      :album => nil,
      :artist => nil
    ))
  end

  it "renders new album_artist form" do
    render

    assert_select "form[action=?][method=?]", album_artists_path, "post" do

      assert_select "input#album_artist_album_id[name=?]", "album_artist[album_id]"

      assert_select "input#album_artist_artist_id[name=?]", "album_artist[artist_id]"
    end
  end
end
