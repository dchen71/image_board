class AddImageRefToTag < ActiveRecord::Migration
  def change
  	add_reference :tags, :image, foreign_key: true
  end
end
