class Playersession < ActiveRecord::Base
	belongs_to :game
	belongs_to :user

	has_many :playedphrases
	has_many :phrases, through: :playedphrases
end
