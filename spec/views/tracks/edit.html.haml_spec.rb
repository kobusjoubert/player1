require 'rails_helper'

RSpec.describe "tracks/edit", :type => :view do
  before(:each) do
    @track = assign(:track, Track.create!(
      :name => "MyString",
      :duration => 1
    ))
  end

  it "renders the edit track form" do
    render

    assert_select "form[action=?][method=?]", track_path(@track), "post" do

      assert_select "input#track_name[name=?]", "track[name]"

      assert_select "input#track_duration[name=?]", "track[duration]"
    end
  end
end
