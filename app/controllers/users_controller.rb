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
			redirect_to new_user_path
		end
	end

	private
	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation, :email)
	end
end
