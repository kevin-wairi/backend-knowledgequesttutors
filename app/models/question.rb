class Question < ApplicationRecord
  has_many_attached :files,dependent: :destroy
  belongs_to :user
end
