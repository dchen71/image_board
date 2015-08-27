require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  def setup
  	@image = Image.new(user_id: 1)
  	@image.pictures = File.new('seed/k1.jpg')
  end
  
  test 'should be valid' do
  	assert @image.valid?
  end

  test 'user id must be present' do
  	@image.user_id = ''
  	assert_not @image.valid?
  end

  test 'pictures must be jpg/jpeg/png' do
  	@image.pictures = File.new('test/fixtures/users.yml')
  	assert_not @image.valid?
  end

end
