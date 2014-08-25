class RenameColumnToGamepassInGames < ActiveRecord::Migration
  def change
  	rename_column :games, :password, :gamepass
  end
end
