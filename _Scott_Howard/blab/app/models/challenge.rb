class Challenge < ActiveRecord::Base
belongs_to :user
has_many :games
has_many :phrases
accepts_nested_attributes_for :phrases

validates :title, presence: true

	def self.search(query)
    where("title LIKE :query", query: "%#{query}%")
  end

end
