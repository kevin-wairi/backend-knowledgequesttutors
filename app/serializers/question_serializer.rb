class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :topic,:subject, :details, :school, :deliverytime, :budget, :pageCount,:user,:academicLevel
  belongs_to :user, Serializer: UsersController
end
