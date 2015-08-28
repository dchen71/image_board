require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  include SessionsHelper
  def setup
  	@user = users(:user1)
  end

  test 'should be able to access new' do
  	get :new
  	assert_response :success
  end
end
