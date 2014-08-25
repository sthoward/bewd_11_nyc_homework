class Story < ActiveRecord::Base
  validates :title, :category, :link, :upvotes, presence: true
  def self.search(query)
    where("title LIKE :query OR category LIKE :query", query: "%#{query}%")
  end
end
