class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :topic
      t.integer :pageCount
      t.datetime :deliverytime
      t.string :budget
      t.string :academicLevel
      t.string :subject
      t.string :details
      t.timestamps
    end
  end
end
