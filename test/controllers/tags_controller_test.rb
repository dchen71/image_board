require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  def setup
  	@tag = tags(:tag1)
  	@other = tags(:tag2)
  	@image = images(:pic1)
  end

  test 'should redirect from create when not logged in' do
  	post :create
  	assert_redirected_to login_url
  end

  test 'search should work' do
  	get :search, id: @tag.id
  	assert_response :success
  end

  test 'should be able to use show' do
  	get :show, id: @tag.id
  	assert_response :success
  end
end
