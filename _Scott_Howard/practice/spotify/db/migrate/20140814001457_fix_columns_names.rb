class FixColumnsNames < ActiveRecord::Migration
  def change
  	rename_column :playlists_tracks, :user_id, :tracks_id

  end
end
