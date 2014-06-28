json.array!(@artists) do |artist|
  json.extract! artist, :id, :name, :about
  json.url artist_url(artist, format: :json)
end
