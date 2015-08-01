class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:success] = "User successfully created"
			redirect_to root_path
		else
			flash.now[:error] = "Error creating user"
			render 'new'
		end
	end

	private
	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation, :email)
	end
end