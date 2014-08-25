class StoriesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]
  def index
    @stories = Story.search(params[:q])
  end

  def new
    @story = Story.new
  end

  def create
    safe_story_params = params.require(:story).permit(:title, :link, :category)
    @story = Story.new safe_story_params.merge(:upvotes => 1)

    if @story.save
      redirect_to @story
    else
      render :new
    end
  end

  def show
    @story = Story.find params[:id]
  end

end
