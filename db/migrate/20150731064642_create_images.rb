class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :tags
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
      add_attachment :images, :pictures
  end
end
