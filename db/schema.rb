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

ActiveRecord::Schema[7.0].define(version: 2022_11_30_045727) do
  create_table "chat_messages", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "room"
    t.integer "user_id"
    t.index ["user_id"], name: "index_chat_messages_on_user_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string "roomname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personal_chats", force: :cascade do |t|
    t.text "content"
    t.integer "send_id"
    t.integer "pair_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pair_id"], name: "index_personal_chats_on_pair_id"
    t.index ["send_id"], name: "index_personal_chats_on_send_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_name"
  end

  add_foreign_key "chat_messages", "users"
  add_foreign_key "personal_chats", "pairs"
  add_foreign_key "personal_chats", "sends"
end
