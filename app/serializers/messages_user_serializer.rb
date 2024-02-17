class MessagesUserSerializer < ActiveModel::Serializer
  attributes :img
  include Rails.application.routes.url_helpers
  def img
    if object.img.attached?
       rails_blob_path(object.img, host:'localhost:3000') 

    else
      []
    end
  end
end
