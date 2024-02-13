class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chat, null: false, foreign_key: true
      t.integer :receiver_id
      t.text :content
      t.boolean :read_status
      t.boolean :delivery_status
      t.timestamps 
    end
  end
end
