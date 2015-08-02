class RemoveReferenceFromTag < ActiveRecord::Migration
  def change
  	remove_reference :tags, :image
  end
end
