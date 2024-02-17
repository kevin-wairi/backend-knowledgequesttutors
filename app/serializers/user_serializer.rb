class UserSerializer < ActiveModel::Serializer
  attributes :id,:username,:school, :email,:phoneNumber,:course,:img,:isAdmin
  has_many :chats, through: :messages
  # has_many :questions
  # has_many :messages
  include Rails.application.routes.url_helpers
  def img
    if object.img.attached?
       rails_blob_path(object.img,  only_path: true)

    else
      []
    end
  end
end
