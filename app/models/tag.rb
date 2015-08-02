class Tag < ActiveRecord::Base
	has_many :taggings
	has_many :images, through: :taggings
	validates_presence_of :tag
	validates :tag, length: {maximum: 30}, uniqueness: true
end
