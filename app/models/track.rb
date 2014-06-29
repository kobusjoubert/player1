class Track < ActiveRecord::Base
  belongs_to :album

  validates_presence_of :name
end
