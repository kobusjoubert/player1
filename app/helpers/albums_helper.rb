module AlbumsHelper
  def album_artists(album)
    result = ""

    album.artists.each do |artist|
      result << artist.name + ", "
    end
    
    if !result.empty?
      "(#{result.chomp(", ")})"
    end
  end

  def album_artist_id(album)
    album_artists = []

    album.artists.each do |artist|
      album_artists << artist.id
    end

    album_artists
  end
end
