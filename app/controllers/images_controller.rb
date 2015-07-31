class ImagesController < ApplicationController
	def index
		@image = Image.new
		@images = Image.all
	end

	def create
		@image = Image.new(image_params)

		if @image.save
			flash[:success] = "Uploaded image"
			redirect_to root_page
		else
			flash[:error] = "Error uploading"
			render 'index'
		end
	end

	def show
		@image = Image.get_by(id: params[:id])
	end

	private

	def image_params
		params.require(:image).permit(:pictures, :tags)
	end
end
