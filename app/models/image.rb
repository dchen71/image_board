class Image < ActiveRecord::Base
  has_attached_file :pictures
  validates_attachment_content_type :pictures, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  validates_with AttachmentPresenceValidator, :attributes => :pictures
  belongs_to :user
  validates_presence_of :user_id
  has_many :comments

end
