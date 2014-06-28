require 'rails_helper'

RSpec.describe "album_artists/index", :type => :view do
  before(:each) do
    assign(:album_artists, [
      AlbumArtist.create!(
        :album => nil,
        :artist => nil
      ),
      AlbumArtist.create!(
        :album => nil,
        :artist => nil
      )
    ])
  end

  it "renders a list of album_artists" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
