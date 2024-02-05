class QuestionSerializer < ActiveModel::Serializer
  attributes :id,:topic,:subject, :details, :deliverytime, :budget, :pageCount,:user,:academicLevel,:created_at,:files
  belongs_to :user
  include Rails.application.routes.url_helpers
  
  def files
    if object.files.attached?
       object.files.map { |file| rails_blob_path(file, only_path: true) } 
    else
      []
    end
  end

end
