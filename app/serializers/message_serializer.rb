class MessageSerializer < ActiveModel::Serializer
  attributes :id,:user_2_id,:chat_id,:content,:read_status,:delivery_status
   belongs_to :user, serializer: MessagesUserSerializer

  #  include Rails.application.routes.url_helpers
  #  def img
  #    if object.img.attached?
  #       rails_blob_path(object.img, only_path: true) 
 
  #    else
  #      []
  #    end
  #  end
end
