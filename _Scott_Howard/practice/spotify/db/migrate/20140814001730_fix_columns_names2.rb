class FixColumnsNames2 < ActiveRecord::Migration
  def change
  	rename_column :playlists_tracks, :tracks_id, :track_id
  end
end
