class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :image
	validates_presence_of :content, :image_id, :user_id
end
