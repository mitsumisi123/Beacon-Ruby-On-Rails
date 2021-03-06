# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_10_02_200513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "devices", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "home_id"
    t.text "identifier"
    t.text "device_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homes", force: :cascade do |t|
    t.text "home_name"
    t.text "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "owner_id"
    t.bigint "sender_id"
    t.bigint "home_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["home_id"], name: "index_requests_on_home_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.text "room_name"
    t.bigint "home_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["home_id"], name: "index_rooms_on_home_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.bigint "device_id"
    t.text "temperature"
    t.text "acceleration"
    t.text "location"
    t.text "motion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_statuses_on_device_id"
  end

  create_table "user_homes", force: :cascade do |t|
    t.bigint "role", default: 1
    t.bigint "user_id"
    t.bigint "home_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["home_id"], name: "index_user_homes_on_home_id"
    t.index ["user_id"], name: "index_user_homes_on_user_id"
  end

  create_table "user_tokens", force: :cascade do |t|
    t.bigint "user_id"
    t.text "divice_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_tokens_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "email"
    t.text "password"
    t.text "username"
    t.text "phone_number"
    t.text "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "notifications", "users"
  add_foreign_key "requests", "homes"
  add_foreign_key "rooms", "homes"
  add_foreign_key "statuses", "devices"
  add_foreign_key "user_homes", "homes"
  add_foreign_key "user_homes", "users"
  add_foreign_key "user_tokens", "users"
end
