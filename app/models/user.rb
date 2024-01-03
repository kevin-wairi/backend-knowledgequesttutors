class User < ApplicationRecord
    has_secure_password
    has_many :questions


  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
end
