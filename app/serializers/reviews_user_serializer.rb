class ReviewsUserSerializer < ActiveModel::Serializer
  attributes :id,:username,:school, :email,:img
  include Rails.application.routes.url_helpers
  def img
    if object.img.attached?
       rails_blob_path(object.img,  only_path: true)

    else
      []
    end
  end
end
