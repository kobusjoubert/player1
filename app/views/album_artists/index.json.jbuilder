json.array!(@album_artists) do |album_artist|
  json.extract! album_artist, :id, :album_id, :artist_id
  json.url album_artist_url(album_artist, format: :json)
end
