class ChatSerializer < ActiveModel::Serializer
  attributes :id, :user_1_id, :user_2_id
  has_many :messages, serializer: MessageChatsSerializer
  # has_many :users, through: :messages
  
end

