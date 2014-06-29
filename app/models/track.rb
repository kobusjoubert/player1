class Track < ActiveRecord::Base
  belongs_to :album

  validates_presense_of :name
end
