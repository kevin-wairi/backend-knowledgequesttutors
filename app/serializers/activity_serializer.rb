class ActivitySerializer < ActiveModel::Serializer
  attributes :id,:user_id,:activity_type,:details,:status,:activity_id,:created_at
  belongs_to :user
end
