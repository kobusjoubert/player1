json.array!(@albums) do |album|
  json.extract! album, :id, :title, :description, :genre
  json.url album_url(album, format: :json)
end
