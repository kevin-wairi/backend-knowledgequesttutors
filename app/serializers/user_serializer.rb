class UserSerializer < ActiveModel::Serializer
  attributes :id,:username,:school, :email,:phoneNumber,:course,:img
  has_many :chats, through: :messages
end
