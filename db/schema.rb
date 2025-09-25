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

ActiveRecord::Schema[8.0].define(version: 2025_09_19_075006) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pg_trgm"

  create_table "chat_room_memberships", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "chat_room_id", null: false
    t.datetime "joined_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "last_read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id"], name: "index_chat_room_memberships_on_chat_room_id"
    t.index ["user_id", "chat_room_id"], name: "index_chat_room_memberships_on_user_id_and_chat_room_id", unique: true
    t.index ["user_id"], name: "index_chat_room_memberships_on_user_id"
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.string "name"
    t.boolean "is_private", default: true
    t.bigint "created_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_chat_rooms_on_created_by_id"
    t.index ["is_private"], name: "index_chat_rooms_on_is_private"
  end

  create_table "friend_requests", force: :cascade do |t|
    t.bigint "sender_id", null: false
    t.bigint "receiver_id", null: false
    t.string "status", default: "pending"
    t.text "message"
    t.datetime "responded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id", "status"], name: "index_friend_requests_on_receiver_id_and_status"
    t.index ["receiver_id"], name: "index_friend_requests_on_receiver_id"
    t.index ["sender_id", "receiver_id"], name: "index_friend_requests_on_sender_id_and_receiver_id", unique: true
    t.index ["sender_id", "status"], name: "index_friend_requests_on_sender_id_and_status"
    t.index ["sender_id"], name: "index_friend_requests_on_sender_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "friend_id", null: false
    t.bigint "friend_request_id", null: false
    t.datetime "became_friends_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id", "user_id"], name: "index_friendships_on_friend_id_and_user_id"
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["friend_request_id"], name: "index_friendships_on_friend_request_id"
    t.index ["user_id", "friend_id"], name: "index_friendships_on_user_id_and_friend_id", unique: true
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "chat_room_id", null: false
    t.text "content", null: false
    t.string "message_type", default: "text"
    t.json "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id", "created_at"], name: "index_messages_on_chat_room_id_and_created_at"
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "sub"
    t.string "name"
    t.string "first_name"
    t.string "last_name"
    t.jsonb "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["first_name"], name: "index_users_on_first_name", opclass: :gin_trgm_ops, using: :gin
    t.index ["last_name"], name: "index_users_on_last_name", opclass: :gin_trgm_ops, using: :gin
    t.index ["name"], name: "index_users_on_name", opclass: :gin_trgm_ops, using: :gin
    t.index ["sub"], name: "index_users_on_sub", unique: true
  end

  add_foreign_key "chat_room_memberships", "chat_rooms"
  add_foreign_key "chat_room_memberships", "users"
  add_foreign_key "chat_rooms", "users", column: "created_by_id"
  add_foreign_key "friend_requests", "users", column: "receiver_id"
  add_foreign_key "friend_requests", "users", column: "sender_id"
  add_foreign_key "friendships", "friend_requests"
  add_foreign_key "friendships", "users"
  add_foreign_key "friendships", "users", column: "friend_id"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "users"
end
