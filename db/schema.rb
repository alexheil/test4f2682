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

ActiveRecord::Schema.define(version: 20150107170104) do

  create_table "artist_profiles", force: true do |t|
    t.integer  "artist_id"
    t.text     "biography",    default: ""
    t.string   "genre",        default: ""
    t.string   "location",     default: ""
    t.string   "members",      default: ""
    t.string   "facebook_url", default: ""
    t.string   "twitter_url",  default: ""
    t.string   "youtube_url",  default: ""
    t.string   "itunes_url",   default: ""
    t.string   "amazon_url",   default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artist_profiles", ["artist_id"], name: "index_artist_profiles_on_artist_id", unique: true

  create_table "artists", force: true do |t|
    t.string   "artist_name",            default: "", null: false
    t.string   "username",               default: "", null: false
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artists", ["confirmation_token"], name: "index_artists_on_confirmation_token", unique: true
  add_index "artists", ["email"], name: "index_artists_on_email", unique: true
  add_index "artists", ["reset_password_token"], name: "index_artists_on_reset_password_token", unique: true
  add_index "artists", ["unlock_token"], name: "index_artists_on_unlock_token", unique: true

  create_table "fans", force: true do |t|
    t.string   "fan_name",               default: "", null: false
    t.string   "username",               default: "", null: false
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fans", ["confirmation_token"], name: "index_fans_on_confirmation_token", unique: true
  add_index "fans", ["email"], name: "index_fans_on_email", unique: true
  add_index "fans", ["reset_password_token"], name: "index_fans_on_reset_password_token", unique: true
  add_index "fans", ["unlock_token"], name: "index_fans_on_unlock_token", unique: true

end
