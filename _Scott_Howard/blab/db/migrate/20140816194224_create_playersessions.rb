class CreatePlayersessions < ActiveRecord::Migration
  def change
    create_table :playersessions do |t|
    	t.belongs_to :game
    	t.belongs_to :user
    	t.integer :score


      t.timestamps
    end
  end
end
