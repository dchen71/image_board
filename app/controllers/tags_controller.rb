class TagsController < ApplicationController
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

	private
	def tag_params
		params.require(:tag).permit(:tag, :image_id)
	end
end
