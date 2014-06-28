require 'rails_helper'

RSpec.describe "album_artists/show", :type => :view do
  before(:each) do
    @album_artist = assign(:album_artist, AlbumArtist.create!(
      :album => nil,
      :artist => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
