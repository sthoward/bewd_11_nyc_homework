class Classified < ActiveRecord::Base
  validates :title, uniqueness: true
  validates :title, presence: true

  belongs_to :user
  has_many :categories
end
