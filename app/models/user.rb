class User < ApplicationRecord
  has_many :microposts
  has_many :statuses
  has_many :user_friendships
  has_many :friends, through: :user_friendships

  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
end
