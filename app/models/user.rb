class User < ActiveRecord::Base
  has_secure_password
  has_many :images

  validates_presence_of :username,:password_digest, :email
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  has_many :comments

  def User.new_remember_token
  	SecureRandom.urlsafe_base64
  end

  def User.digest(token)
  	Digest::SHA1.hexdigest(token.to_s)
  end

  private
  def create_remember_token
  	self.remember_token = User.digest(User.new_remember_token)
  end
end
