class AddAlbumToTracks < ActiveRecord::Migration
  def change
    add_reference :tracks, :album, index: true
  end
end
