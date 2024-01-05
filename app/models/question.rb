class Question < ApplicationRecord
  has_one_attached :attachment
  belongs_to :user, dependent: :destroy
end
