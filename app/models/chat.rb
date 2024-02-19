class Chat < ApplicationRecord
    has_many :messages
    has_many :users, through: :messages,dependent: :destroy
    has_many_attached :img
end
