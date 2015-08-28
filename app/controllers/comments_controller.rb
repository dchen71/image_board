class CommentsController < ApplicationController
	include SessionsHelper
	before_action :require_login, only: [:create]

	def create
		@comment = Comment.create(comment_params)
		redirect_to :back
	end

	private
	def comment_params
		params.require(:comment).permit(:user_id, :image_id, :content)
	end

    def require_login
      unless signed_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
	end
end
