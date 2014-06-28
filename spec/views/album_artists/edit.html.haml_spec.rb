require 'rails_helper'

RSpec.describe "album_artists/edit", :type => :view do
  before(:each) do
    @album_artist = assign(:album_artist, AlbumArtist.create!(
      :album => nil,
      :artist => nil
    ))
  end

  it "renders the edit album_artist form" do
    render

    assert_select "form[action=?][method=?]", album_artist_path(@album_artist), "post" do

      assert_select "input#album_artist_album_id[name=?]", "album_artist[album_id]"

      assert_select "input#album_artist_artist_id[name=?]", "album_artist[artist_id]"
    end
  end
end
