class AddPasswordColumnToGames < ActiveRecord::Migration
  def change
  	add_column :games, :password, :string
  end
end
