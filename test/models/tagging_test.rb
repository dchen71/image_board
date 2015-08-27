require 'test_helper'

class TaggingTest < ActiveSupport::TestCase
  def setup
  	@tagging = Tagging.new(tag_id: 1, image_id: 1)
  end

  test 'taging should be valid' do
  	assert @tagging.valid?
  end

  test 'tagging should be unique per image' do
  	@tagging.save
  	@new_tag = Tagging.new(tag_id: 1, image_id: 2)
  	assert @new_tag.valid?
  	@new_tag.image_id = 1
  	assert_not @new_tag.valid?
  end

end
