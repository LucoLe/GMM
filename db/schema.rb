# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150325100531) do

  create_table "club_owners", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "club_owners", ["email"], name: "index_club_owners_on_email", unique: true
  add_index "club_owners", ["reset_password_token"], name: "index_club_owners_on_reset_password_token", unique: true

  create_table "clubs", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.string   "city"
    t.string   "address"
    t.integer  "postal_code"
    t.string   "phone_number"
    t.integer  "club_owner_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "clubs", ["club_owner_id"], name: "index_clubs_on_club_owner_id", unique: true

  create_table "members", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthdate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "club_id"
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subscriptions", ["club_id", "member_id"], name: "index_subscriptions_on_club_id_and_member_id", unique: true

  create_table "workouts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "club_id"
    t.integer  "member_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "workouts", ["club_id"], name: "index_workouts_on_club_id"
  add_index "workouts", ["member_id"], name: "index_workouts_on_member_id"

end
