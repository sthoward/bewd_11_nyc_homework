class AddPlayedflagColumnToPhrases < ActiveRecord::Migration
  def change
  	add_column :phrases, :playedflag, :boolean
  end
end
