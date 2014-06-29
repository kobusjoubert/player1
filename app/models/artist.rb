class Artist < ActiveRecord::Base
  has_many :album_artists, dependent: :destroy
  has_many :albums, through: :album_artists

  has_attached_file :picture,
    s3_permissions: {
      original: :public_read,
      extra_large: :public_read,
      small: :public_read
    },
    styles: {
      extra_large: '250x250#',
      small: '34x34#'
    }

  validates_attachment :picture, content_type: { content_type: /\Aimage/ }, file_name: { matches: [/png\Z/, /x-png\Z/, /p?jpe?g\Z/, /gif\Z/], message: 'image should be of type jpg, jpeg, png or gif' }, size: { in: 0..2000.kilobytes, message: 'should not be greater than 2MB' }

  validates_presence_of :name

  # http://stackoverflow.com/questions/4049709/save-image-from-url-by-paperclip
  def picture_from_url(url)
    self.picture = URI.parse(url)
  end
end
