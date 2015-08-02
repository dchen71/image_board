class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :image
  validates :tag_id, uniqueness: {scope: :image_id}
end
