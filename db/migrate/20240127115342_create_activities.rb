class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :activity_type
      t.text :details
      t.string :status
      t.integer :activity_id
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
