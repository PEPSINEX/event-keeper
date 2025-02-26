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

ActiveRecord::Schema.define(version: 20180822160441) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "communities", force: :cascade do |t|
    t.string "name"
    t.text "summary"
    t.string "icon"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "community_users", force: :cascade do |t|
    t.bigint "community_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_community_users_on_community_id"
    t.index ["user_id"], name: "index_community_users_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "community_id"
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_contacts_on_community_id"
    t.index ["event_id"], name: "index_contacts_on_event_id"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "event_participants", force: :cascade do |t|
    t.integer "event_id"
    t.integer "participant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "image"
    t.integer "maximum_number_of_people"
    t.datetime "deadline_of_participant_for_event"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "opening_time"
    t.datetime "ending_time"
    t.boolean "receptionist"
    t.date "event_day"
    t.boolean "beginig_of_the_event_day"
    t.bigint "community_id"
    t.index ["community_id"], name: "index_events_on_community_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "community_users", "communities"
  add_foreign_key "community_users", "users"
  add_foreign_key "contacts", "communities"
  add_foreign_key "contacts", "events"
  add_foreign_key "contacts", "users"
  add_foreign_key "events", "communities"
end
