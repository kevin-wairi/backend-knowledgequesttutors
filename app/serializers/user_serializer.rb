class UserSerializer < ActiveModel::Serializer
  attributes :id,:username,:school, :email,:phoneNumber,:course
end
