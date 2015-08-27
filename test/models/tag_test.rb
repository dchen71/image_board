require 'test_helper'

class TagTest < ActiveSupport::TestCase
  def setup
  	@tag = Tag.new(tag: 'qoo')
  end

  test 'should be valid' do
  	assert @tag.valid?
  end

  test 'tag should be present' do
  	@tag.tag = ''
  	assert_not @tag.valid?
  end

  test 'tag max length of 30' do
  	@tag.tag = 'c' * 31
  	assert_not @tag.valid?
  end

  test ' tag must be unique' do
  	@tag.save
  	@newtag = Tag.new(tag: 'qoo')
  	assert_not @newtag.valid?
  end
end
