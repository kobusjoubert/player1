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
end
