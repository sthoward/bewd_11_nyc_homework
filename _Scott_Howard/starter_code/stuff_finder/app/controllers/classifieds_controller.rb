class ClassifiedsController < ApplicationController
before_filter :authenticate_user!, only: [:new, :create]

	def index
		@classifieds = Classified.all
	end

	def new
		@classified = Classified.new
	end

	def create
		safe_classified_params = params.require(:classified).permit(:title, :description, :price)
		@classified = current_user.classifieds.build safe_classified_params

	
		if @classified.save
      redirect_to @classified
    else
      render :new
    end
	end

	def show
		@classified = Classified.find params[:id]
	end

end
