class TagsController < ApplicationController
	include SessionsHelper

	before_action :require_login, only: :create

	def create
		@tag = Tag.new(tag_params)
		@image = Image.find_by(id: tag_params)

		if @tag.save
			Tagging.create(tag_id: @tag.id, image_id: @image.id)
			flash[:success] = "Successfully added tag"
			redirect_to :back
		else
			@oldtag = Tag.find_by(tag: @tag.tag)
			unless @oldtag.nil?
				@tagging = Tagging.new(tag_id: @oldtag.id, image_id: @image.id)
				if @tagging.save
					flash[:success] = "Successfully added tag"
					redirect_to :back
				else
					flash[:error] = "Already tagged"
					redirect_to :back
				end
			else
				flash[:error] = "Error adding tag"
				redirect_to :back
			end
		end
	end

	def show
		@tag = Tag.find_by(id: params[:id])
		@image = Image.new
		@images = @tag.images
		@tags = Set.new
		@images.each do |i|
			i.tags.each do |j|
				@tags.add(j)
			end
		end
		@tags = @tags.take(10)
	end

	def search
		@tag = Tag.find_by(tag: params[:tag])
		
		unless @tag.nil?
			@images = @tag.images
			@tags = Set.new
			@images.each do |i|
				i.tags.each do |j|
					@tags.add(j)
				end
			end
			@tags = @tags.take(10)
		else
			@tags = Tag.take(10)
			@images = false
		end
	end

	private
	def tag_params
		params.require(:tag).permit(:tag)
	end

	def image_params
		params.permit(:image_id)
	end


	def require_login
      unless signed_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
	end
end
