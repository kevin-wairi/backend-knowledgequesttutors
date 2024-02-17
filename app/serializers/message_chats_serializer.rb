class MessageChatsSerializer < ActiveModel::Serializer
  attributes :id,:user_id,:receiver_id,:content

end
