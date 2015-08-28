require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
  	@user = users(:user1)
  end

  test 'get new' do
  	get :new
  	assert_response :success
  end

  test 'post create' do
  	post :create, user: {username: 'bob', email: 'cat@yahoo.com', password: 'password', password_confirmation: 'password'}
  	assert_redirected_to root_path
  end

  test 'get show' do
  	get :show, id: @user.id
  	assert_response :success
  end
end
