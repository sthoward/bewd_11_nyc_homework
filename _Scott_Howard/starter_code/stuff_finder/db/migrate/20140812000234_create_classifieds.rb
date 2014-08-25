class CreateClassifieds < ActiveRecord::Migration
  def change
    create_table :classifieds do |t|
      t.string :title
      t.string :description
      t.string :price
      t.timestamps
    end
  end
end
