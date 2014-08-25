class Playedphrase < ActiveRecord::Base
	belongs_to :playersession
	belongs_to :phrase

end
