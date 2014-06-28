require 'rails_helper'

RSpec.describe "albums/show", :type => :view do
  before(:each) do
    @album = assign(:album, Album.create!(
      :title => "Title",
      :description => "MyText",
      :genre => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
  end
end
