class Album < ActiveRecord::Base
  has_many :album_artists
  has_many :artists, through: :album_artists
  has_many :tracks

  enum genre: [:not_set, :blues, :classical, :country, :electronic, :folk, :jazz, :new_age, :reggae, :rock]
end
