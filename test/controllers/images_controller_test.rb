require 'test_helper'

class ImagesControllerTest < ActionController::TestCase
  def setup
  	@image = images(:pic1)
  	@user = users(:user1)
  	@image.user_id = @user.id
  	@image.save
  end

  test 'should redirect from new when not logged in' do
  	get :new
  	assert_redirected_to login_path
  end

  test 'should redirect from create when not logged in' do
  	post :create
  	assert_redirected_to login_path
  end

  test 'index should work' do
  	get :index
  	assert_response :success
  end

  test 'show should work' do
  	get(:show, {id: @image.id})
  	assert_response :success
  end
end
