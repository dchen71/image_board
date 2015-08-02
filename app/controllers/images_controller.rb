class ImagesController < ApplicationController
	include SessionsHelper

	before_action :require_login, only: :create

	def index
		@tags = Tag.take(10)
		@image = Image.new
		@tag = Tag.new
		if params[:tag]
			@images = Image.find_by(id: Tag.find_by(tag:params[:tag]).image_id)
		else
			@images = Image.all
		end
	end

	def create
		@image = Image.new(image_params)

		if @image.save
			flash[:success] = "Uploaded image"
			redirect_to root_path
		else
			flash[:error] = "Error uploading"
			redirect_to :back
		end
	end

	def show
		@image = Image.find_by(id: params[:id])
		@comment = Comment.new
		@tag = Tag.new
		@tags = @image.tags
	end

	private

	def image_params
		params.require(:image).permit(:pictures, :user_id)
	end

	def require_login
      unless signed_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
	end
end
