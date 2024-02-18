class Message < ApplicationRecord
    belongs_to :user
    belongs_to :chat
    has_one_attached :sender_img
end
