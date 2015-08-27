require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = User.new(username: 'bob', password_digest: 'coolcool', email: 'bob@bob.com')
  end

  test 'user is valid' do
  	assert @user.valid?
  end

  test 'username is needed' do
  	@user.username = ' '
  	assert_not @user.valid?
  end

  test 'password is needed' do
  	@user.password_digest = ' '
  	assert_not @user.valid?
  end

  test 'email is needed' do
  	@user.email = ' '
  	assert_not @user.valid?
  end

  test 'email must be email' do
  	@user.email = 'catman'
  	assert_not @user.valid?
  end
end
