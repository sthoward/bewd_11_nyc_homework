class CreatePlaylistsTracksJoinTable < ActiveRecord::Migration
  def change
  	create_table :playlists_tracks do |t|
      t.integer :user_id
      t.integer :playlist_id

      t.timestamps
    end
  end
end
