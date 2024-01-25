class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :subject, :title, :details, :school, :course, :deliverytime, :budget, :pageCount,:user,:academicLevel
  belongs_to :user, Serializer: UsersController
end
