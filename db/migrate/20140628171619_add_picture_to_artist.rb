class AddPictureToArtist < ActiveRecord::Migration
  def self.up
    add_attachment :artists, :picture
  end

  def self.down
    remove_attachment :artists, :picture
  end
end
