class User < ApplicationRecord
    has_secure_password
    has_many :questions
    has_many :messages, dependent: :destroy
    has_many :chats, through: :messages


  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
end
