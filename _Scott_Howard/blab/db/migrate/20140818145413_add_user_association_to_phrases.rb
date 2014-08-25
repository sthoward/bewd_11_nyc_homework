class AddUserAssociationToPhrases < ActiveRecord::Migration
  def change
  	add_reference :phrases, :user
  end
end
