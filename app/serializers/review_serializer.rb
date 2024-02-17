class ReviewSerializer < ActiveModel::Serializer
  attributes :id,:review,:rating,:approved
  belongs_to :user, serializer: ReviewsUserSerializer
  
end
