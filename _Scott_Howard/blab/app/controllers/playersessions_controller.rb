class PlayersessionsController < ApplicationController

	def new
		@game = Game.find params[:id]
		
	end
end
