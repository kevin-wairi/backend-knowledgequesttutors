class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :school
      t.string :course
      t.string :email
      t.string :phoneNumber
      t.string :password_digest
      t.boolean :isAdmin, default: false

      t.timestamps
    end
  end
end
