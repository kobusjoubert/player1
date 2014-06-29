class Album < ActiveRecord::Base
  has_many :album_artists
  has_many :artists, through: :album_artists
  has_many :tracks
  
  enum genre: [:not_set, :blues, :classical, :country, :electronic, :folk, :jazz, :new_age, :reggae, :rock]

  has_attached_file :cover,
    s3_permissions: {
      original: :public_read,
      mega: :public_read,
      extra_large: :public_read,
      small: :public_read
    },
    styles: {
      mega: '500x500#',
      extra_large: '250x250#',
      small: '34x34#'
    }

  validates_attachment :cover, content_type: { content_type: /\Aimage/ }, file_name: { matches: [/png\Z/, /x-png\Z/, /p?jpe?g\Z/, /gif\Z/], message: 'image should be of type jpg, jpeg, png or gif' }, size: { in: 0..2000.kilobytes, message: 'should not be greater than 2MB' }

  validates_presence_of :title
  # validates_presence_of :album_artists

  # http://stackoverflow.com/questions/4049709/save-image-from-url-by-paperclip
  def cover_from_url(url)
    self.cover = URI.parse(url)
  end
end
