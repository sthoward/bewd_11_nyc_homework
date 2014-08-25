class Category < ActiveRecord::Base
	validates :name, uniqueness: true
  validates :name, presence: true
  
	has_many :classifieds

end
