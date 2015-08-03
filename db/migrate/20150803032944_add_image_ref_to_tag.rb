class AddImageRefToTag < ActiveRecord::Migration
  def change
  	add_reference :tags, :image
  end
end
