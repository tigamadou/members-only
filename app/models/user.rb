class User < ApplicationRecord
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, presence:true, length: { minimum: 3}, uniqueness: { case_sensitive: false }
  validates :email, presence:true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence:true
  
  has_secure_password
end
