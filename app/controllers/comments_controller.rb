class CommentsController < ApplicationController
  def create
  	Comment.create(comment_params)
  	redirect_to :back
  end

private
	def comment_params
	params.require(:comment).permit(:text, :user_id, :event_id)
	end
end
