class CreateAlbumArtists < ActiveRecord::Migration
  def change
    create_table :album_artists do |t|
      t.references :album, index: true
      t.references :artist, index: true

      t.timestamps
    end
  end
end
