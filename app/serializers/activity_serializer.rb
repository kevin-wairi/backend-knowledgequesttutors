class ActivitySerializer < ActiveModel::Serializer
  attributes :id,:user_id,:action_type,:resource_id,:created_at
  belongs_to :user
end
