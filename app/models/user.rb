class User < ActiveRecord::Base
  has_secure_password
  has_many :images

  validates_presence_of :username,:password_digest, :email
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end
