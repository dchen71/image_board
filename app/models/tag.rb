class Tag < ActiveRecord::Base
	belongs_to :image
	validates_presence_of :tag
	validates :tag, length: {maximum: 30}, uniqueness: {scope: :image_id}
end
