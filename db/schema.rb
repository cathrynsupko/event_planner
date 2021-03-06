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

ActiveRecord::Schema.define(version: 20151210232808) do

  create_table "attendings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "attendee_id"
    t.integer  "attended_event_id"
    t.boolean  "going"
  end

  add_index "attendings", ["event_id"], name: "index_attendings_on_event_id"
  add_index "attendings", ["user_id"], name: "index_attendings_on_user_id"

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "event_id"
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.time     "start"
    t.time     "end"
    t.text     "description"
    t.string   "location"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.date     "date"
    t.boolean  "private",     default: false
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "invitations", force: :cascade do |t|
    t.integer  "inviter_id"
    t.integer  "invitee_id"
    t.integer  "event_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "invitee_ids", default: 0
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
