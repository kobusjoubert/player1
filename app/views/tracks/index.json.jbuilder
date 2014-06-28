json.array!(@tracks) do |track|
  json.extract! track, :id, :name, :duration
  json.url track_url(track, format: :json)
end
