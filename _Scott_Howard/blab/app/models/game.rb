class Game < ActiveRecord::Base
	# validates :url, presence: true
	# validates :url, uniqueness: true

	belongs_to :user
	belongs_to :challenge
	has_many :game_players, through: :playersessions, source: :user
	has_many :playersessions
	# has_many :phrases, through: :challenges

	

end
