class PhrasesController < ApplicationController
	before_action :authenticate_user!

	def create
		safe_phrase = params.require(:phrase).permit(:text)
		challenge_id = params[:challenge_id]
		@challenge = Challenge.find(challenge_id)
		@phrase = current_user.phrases.build safe_phrase
		@phrase.challenge = @challenge
		@phrase.save
		redirect_to edit_challenge_path(@challenge)
	end

	def destroy
		@phrase = Phrase.find (params[:id])
	  @challenge = @phrase.challenge
	  @phrase.destroy
	  flash[:notice] = "Successfully deleted phrase."
	  redirect_to edit_challenge_path(@challenge)
	end

end