class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :user_id
      t.text :content
      t.string :email
      t.string :username
      t.string :user_img

      t.timestamps
    end
  end
end
