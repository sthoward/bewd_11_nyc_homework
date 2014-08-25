class ChallengesController < ApplicationController
	before_action :authenticate_user!

	def new
		@challenge = Challenge.new
	end

	def create
		@challenge = current_user.challenges.build challenge_params

		if @challenge.save
			redirect_to edit_challenge_path(@challenge)
		else
			render :new
		end
	end

	def show
		@challenge = Challenge.find params[:id]
		@phrase = Phrase.new(:challenge => @challenge)
	end

	def edit
		@challenge = Challenge.find params[:id]
		@user = current_user
		@phrase = Phrase.new(:challenge => @challenge)
		@phrases = @challenge.phrases

		if @user != @challenge.user
			flash[:alert] = "You must be the author of the challenge to edit it! Try making a New Challenge below."
  		redirect_to new_game_path
  	end

	end


	private
		def challenge_params
			params.require(:challenge).permit(:title, :adult_flag, :private_flag)
		end

end
 