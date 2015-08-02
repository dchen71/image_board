class SessionsController < ApplicationController
	include SessionsHelper
	def new
		@tag = Tag.new
		@tags = Tag.take(10)
	end

	def create
		@user = User.find_by(email: params[:email].downcase)
		if @user && @user.authenticate(params[:password])
			flash[:success] = "Successfully signed in"
			sign_in @user
			redirect_to root_path
		else
			flash.now[:error] = "Invalid email/password combination"
			render 'new'
		end
	end

	def destroy
		sign_out
		flash[:success] = "Successfully logged out"
		redirect_to root_path
	end
end
