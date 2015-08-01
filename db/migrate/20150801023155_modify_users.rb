class ModifyUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :encrypted_password 
  	add_column :users, :password_digest, :string
  	add_column :users, :email, :string
  end
end
