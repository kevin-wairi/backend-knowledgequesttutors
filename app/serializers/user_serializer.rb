class UserSerializer < ActiveModel::Serializer
  attributes :id,:username,:school, :email,:phoneNumber,:course,:img,:isAdmin
  # has_many :chats, through: :messages
  # has_many :questions
  # has_many :messages
end
