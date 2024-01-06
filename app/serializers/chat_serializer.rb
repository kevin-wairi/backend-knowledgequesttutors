class ChatSerializer < ActiveModel::Serializer
  attributes :id,:sender_id,:receiver_id
  has_many :messages
  has_many :users, through: :messages
end
