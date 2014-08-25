class PlayedphrasesController < ApplicationController


	def create
		# binding.pry
		@playersession = Playersession.find params[:playedphrase][:playersession]
		@game = @playersession.game
		@phrase = Phrase.find params[:playedphrase][:phrase]
		
		@playedphrase = Playedphrase.new
		@playedphrase.playersession = @playersession
		@playedphrase.phrase = @phrase
		@playedphrase.save

		#increment player's score
		@playersession.score += 10
		@playersession.save

		#mark phrase as played
		@phrase.playedflag = true


		redirect_to @game
	end

end
