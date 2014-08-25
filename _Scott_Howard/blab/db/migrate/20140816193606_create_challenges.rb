class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
    	t.string :title
    	t.boolean :adult_flag
    	t.boolean :private_flag
    	t.integer :up_down_vote
    	t.belongs_to :user

      t.timestamps
    end
  end
end
