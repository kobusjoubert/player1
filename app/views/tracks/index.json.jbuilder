json.array!(@album.tracks) do |track|
  json.extract! track, :id, :name, :duration, :album_id
  json.url album_track_url(@album, track, format: :json)
end
