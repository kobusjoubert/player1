class Album < ActiveRecord::Base
  has_many :album_artists
  has_many :artists, through: :album_artists
  has_many :tracks

  enum genre: [:none, :blues, :classical, :country, :electronic, :folk, :jazz, :new_age, :reggae, :rock]
end
