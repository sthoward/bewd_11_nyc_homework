class CommentsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    safe_comment = params.require(:comment).permit(:post)
    story_id = params[:story_id]
    story = Story.find(story_id)
    @comment = current_user.comments.build safe_comment
    @comment.story = story
    @comment.save
    redirect_to @comment.story
  end
end
