class Story < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :commenters, through: :comments, source: :user

  validates :title, :category, :link, :upvotes, presence: true
  
  def self.search(query)
    where("title LIKE :query OR category LIKE :query", query: "%#{query}%")
  end
end
