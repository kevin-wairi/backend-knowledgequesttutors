class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :subject
      t.string :title
      t.string :details
      t.string :school
      t.string :course
      t.string :completetime
      t.string :deliverytime
      t.string :budget

      t.timestamps
    end
  end
end
