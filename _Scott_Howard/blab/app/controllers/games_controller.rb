class GamesController < ApplicationController
	before_action :authenticate_user!, except: [:show]

	def new
		@game = Game.new
		@challenges = Challenge.all
		@temp = SecureRandom.urlsafe_base64(8)

	end

	def create 
		@game = current_user.games.build game_params
		@game.active_flag = true
		# @game.url = Secure

		if @game.save
			redirect_to @game
		else
			render :new
		end
	end

	def edit
		@game = Game.find params[:id]
		@playersession = Playersession.new
		@playersession.user = current_user
		@playersession.game = @game
		if @playersession.score == nil ###move to model
			@playersession.score = 0
		end
		@playersession.save

		redirect_to @game
	end

	def show
		begin
  		@game = Game.find params[:id]
		rescue ActiveRecord::RecordNotFound
			error = true
  		flash[:alert] = "Bummer. Double check that url."
  		redirect_to root_path
		end

		if !error
			@player = current_user
			@challenge = @game.challenge
			@phrases = @challenge.phrases
			@playersession = Playersession.where(user: @player, game: @game).first
			@playersessions = @game.playersessions
			@playedphrases = determine_played_phrases
			@playedphrase = Playedphrase.new

			@remainingphrases = determine_remaining_phrases 
			
			@remainingtime = determine_remaining_time
		end
		
		
		# @gameover = determine_game_over
	end

	def redirector
		@game = Game.find_by url: params[:code]
		@playersessions = @game.playersessions

		if @game
			if !current_player?
				redirect_to controller:'games', action: 'preview', id: @game.id 
			else
				flash[:notice] = "Here's the game you requested."
				redirect_to @game
			end
		else
			flash[:alert] = "Bummer. Double check that url."
			redirect_to root_path
		end
	end

	def preview
		@game = Game.find params[:id]
		@player = current_user
		@challenge = @game.challenge
		@phrases = @challenge.phrases
		@playersession = Playersession.where(user: @player, game: @game).first
		@playersessions = @game.playersessions
		@playedphrases = determine_played_phrases
		@playedphrase = Playedphrase.new

		@remainingphrases = determine_remaining_phrases 
		@remainingtime = @game.duration
	end

	def verify_new_player
		@game = Game.find params[:game]
		password = params[:password]
		if password == @game.gamepass
			flash[:notice] = "Here's the game you requested."
			redirect_to edit_game_path(@game)
		else
			flash[:alert] = "Do you belong here? Double check that password."
			redirect_to :back
		end
	end

	private 
		def game_params
			params.require(:game).permit(:challenge_id, :duration, :url, :gamepass)
		end

		def determine_remaining_phrases
			remain = @game.challenge.phrases

			@playersessions.each do |session|
				remain -= session.phrases
			end

			return remain
		end

		def determine_played_phrases
			played = []
			@playersessions.each do |session|
				session.phrases.each do |phrase|
					played << phrase
				end
			end
			# binding.pry
			return played
		end

		def determine_remaining_time
			duration = @game.duration
			if @game.playersessions.any?
				starttime = @game.playersessions.first.created_at
				currenttime = Time.new
				remainingtime = starttime + duration*60*60 - currenttime
				if remainingtime < 0 then 
					@game.active_flag = false 
					remainingtime = 0
				end
			else
				remainingtime = duration
			end
			return remainingtime
		end

end
