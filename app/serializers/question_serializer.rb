class QuestionSerializer < ActiveModel::Serializer
  attributes :id,:topic,:subject, :details, :deliverytime, :budget, :pageCount,:user,:academicLevel,:created_at,:files
  belongs_to :user
  include Rails.application.routes.url_helpers
  
  def files
    if object.files.attached?
       object.files.map do |file| {
        name: file.filename.to_s,
          content_type: file.content_type,
          url: rails_blob_path(file, host: 'localhost:3000')
        }
      end
    else
      []
    end
  end

end
