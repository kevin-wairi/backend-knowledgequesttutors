class MessageSerializer < ActiveModel::Serializer
  attributes :id,:user_id,:receiver_id,:chat_id,:content,:read_status,:delivery_status,:user_img
  # belongs_to :user, Serializer: UsersController
end
