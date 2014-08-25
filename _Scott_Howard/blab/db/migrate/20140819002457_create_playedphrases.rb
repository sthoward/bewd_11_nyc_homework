class CreatePlayedphrases < ActiveRecord::Migration
  def change
    create_table :playedphrases do |t|
    	t.belongs_to :playersession
    	t.belongs_to :phrase
    	
      t.timestamps
    end
  end
end
