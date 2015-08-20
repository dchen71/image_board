class UsersController < ApplicationController
	def new
		@user = User.new
		@tag = Tag.new
		@tags = Tag.take(10)
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:success] = "User successfully created"
			redirect_to root_path
		else
			flash[:error] = "Error creating user"
			@tags = Tag.take(10)
			render 'new'
		end
	end

	def show
		@user = User.find_by(id: params[:id])
		@image = Image.new
		@images = @user.images
		@tag = Tag.new
		@tags = Set.new
		@images.each do |i|
			i.tags.each do |j|
				@tags.add(j)
			end
		end
		@tags = @tags.take(10)
	end

	private
	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation, :email)
	end
end
