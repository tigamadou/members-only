class User < ApplicationRecord
  attr_accessor :remember_key

  before_create :remember
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, presence:true, length: { minimum: 3}, uniqueness: { case_sensitive: false }
  validates :email, presence:true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence:true
  
  has_secure_password

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_key = User.new_token
    self.remember_token = User.digest(remember_key)
  end

  def update_token
    self.remember_key = User.new_token
    update_attribute(:remember_token, User.digest(remember_key))
  end

end
