require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
  	@comment = Comment.new(content: 'coo coo', image_id: 1, user_id: 1)
  end

  test 'should be valid' do
  	assert @comment.valid?
  end

  test 'image_id must be present' do
  	@comment.image_id = ''
  	assert_not @comment.valid?
  end

  test 'content must be present' do
  	@comment.content = ''
  	assert_not @comment.valid?
  end

  test 'user_id must be present' do
  	@comment.user_id = ''
  	assert_not @comment.valid?
  end
end
