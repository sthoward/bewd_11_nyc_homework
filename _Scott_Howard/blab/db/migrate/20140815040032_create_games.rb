class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    	t.boolean :active_flag
    	t.integer :duration
    	t.belongs_to :challenge
    	t.belongs_to :user

      t.timestamps
    end
  end
end
