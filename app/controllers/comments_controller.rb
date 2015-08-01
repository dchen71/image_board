class CommentsController < ApplicationController
	def create
		@comment = Comment.create(comment_params)
		redirect_to :back
	end

	private
	def comment_params
		params.require(:comment).permit(:user_id, :image_id, :content)
	end
end
