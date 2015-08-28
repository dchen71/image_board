require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  def setup
  	@comment = comments(:com1)
  	@image = images(:pic1)
  	@user = users(:user1)
  end

  test 'need to be logged in to comment' do
  	post :create
  	assert_redirected_to login_url
  end

end
