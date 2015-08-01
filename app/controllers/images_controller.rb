class ImagesController < ApplicationController
	include SessionsHelper

	before_action :require_login, only: :create

	def index
		@image = Image.new
		@images = Image.all
	end

	def create
		@image = Image.new(image_params)

		if @image.save
			flash[:success] = "Uploaded image"
			redirect_to root_path
		else
			flash[:error] = "Error uploading"
			render 'index'
		end
	end

	def show
		@image = Image.find_by(id: params[:id])
		@comment = Comment.new
		@tag = Tag.new
	end

	private

	def image_params
		params.require(:image).permit(:pictures, :tags, :user_id)
	end

	def require_login
      unless signed_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
	end
end
