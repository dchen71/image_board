class TagsController < ApplicationController
	include SessionsHelper

	before_action :require_login, only: :create

	def create
		@tag = Tag.new(tag_params)

		if @tag.save
			flash[:success] = "SUccessfully added tag"
			redirect_to :back
		else
			flash.now[:error] = "Error adding tag"
			redirect_to :back
		end
	end

	def show
		@tag = Tag.find_by(id: params[:id])
		@images = Image.find_by(id: @tag.image_id)
	end

	private
	def tag_params
		params.require(:tag).permit(:tag, :image_id)
	end

	def require_login
      unless signed_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
	end
end
