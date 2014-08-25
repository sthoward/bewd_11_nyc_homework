class Phrase < ActiveRecord::Base
	belongs_to :challenge
	belongs_to :user #added this to make phrase additions
	
	has_many :playedphrases
	has_many :playersessions, through: :playedphrases
end
