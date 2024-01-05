class MessageSerializer < ActiveModel::Serializer
  attributes :id,:user_id,:chat_id,:content,:read_status,:delivery_status
  belongs_to :user, Serializer: UsersController
end
