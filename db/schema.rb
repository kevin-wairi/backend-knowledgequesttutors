# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_01_14_075125) do
  create_table "chats", force: :cascade do |t|
    t.integer "sender_id", null: false
    t.integer "receiver_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_chats_on_receiver_id"
    t.index ["sender_id"], name: "index_chats_on_sender_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "user_id"
    t.text "content"
    t.string "email"
    t.string "username"
    t.string "user_img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "chat_id", null: false
    t.string "user_img"
    t.integer "receiver_id"
    t.text "content"
    t.boolean "read_status"
    t.boolean "delivery_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "topic"
    t.string "subject"
    t.string "details"
    t.string "school"
    t.integer "pageCount"
    t.string "deliverytime"
    t.string "budget"
    t.string "academicLevel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "school"
    t.string "course"
    t.string "email"
    t.string "phoneNumber"
    t.string "password_digest"
    t.string "img"
    t.boolean "isAdmin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_foreign_key "chats", "users", column: "receiver_id"
  add_foreign_key "chats", "users", column: "sender_id"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
  add_foreign_key "questions", "users"
end
