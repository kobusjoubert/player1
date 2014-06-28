class Artist < ActiveRecord::Base
  has_many :album_artists
  has_many :albums, through: :album_artists
end
