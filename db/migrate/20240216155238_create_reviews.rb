class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.string :review
      t.integer :rating
      t.boolean :approved
      t.timestamps
    end
  end
end
