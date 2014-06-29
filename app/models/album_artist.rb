class AlbumArtist < ActiveRecord::Base
  belongs_to :album
  belongs_to :artist

  validates_uniqueness_of :album_id, scope: :artist_id
end
