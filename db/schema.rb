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

ActiveRecord::Schema.define(version: 20150227003647) do

  create_table "artist_albums", force: true do |t|
    t.integer  "artist_id"
    t.string   "album_name"
    t.integer  "album_year"
    t.string   "album_cover_art_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artist_albums", ["artist_id"], name: "index_artist_albums_on_artist_id"

  create_table "artist_merch_purchases", force: true do |t|
    t.integer  "artist_id"
    t.integer  "fan_id"
    t.integer  "artist_merch_id"
    t.string   "merch_name"
    t.string   "fan_username"
    t.integer  "quantity",           default: 1
    t.integer  "base_price"
    t.integer  "shipping_price"
    t.integer  "pay_your_own_price", default: 0
    t.integer  "complete_price"
    t.string   "full_name",          default: ""
    t.string   "street_address",     default: ""
    t.string   "city",               default: ""
    t.string   "state",              default: ""
    t.string   "country",            default: ""
    t.string   "zip_code",           default: ""
    t.boolean  "is_shipped",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artist_merch_purchases", ["artist_id"], name: "index_artist_merch_purchases_on_artist_id"
  add_index "artist_merch_purchases", ["artist_merch_id"], name: "index_artist_merch_purchases_on_artist_merch_id"
  add_index "artist_merch_purchases", ["fan_id"], name: "index_artist_merch_purchases_on_fan_id"

  create_table "artist_merches", force: true do |t|
    t.integer  "artist_id"
    t.string   "paypal_email"
    t.string   "about"
    t.string   "merch_name"
    t.text     "merch_description"
    t.integer  "base_price"
    t.integer  "shipping_price"
    t.integer  "total_price"
    t.integer  "quantity"
    t.string   "options"
    t.text     "return_policy"
    t.text     "shipping_info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "merch_image",       default: ""
  end

  add_index "artist_merches", ["artist_id"], name: "index_artist_merches_on_artist_id"

  create_table "artist_micropost_comments", force: true do |t|
    t.integer  "artist_micropost_id"
    t.integer  "artist_id"
    t.integer  "fan_id"
    t.string   "artist_name"
    t.string   "fan_name"
    t.text     "content"
    t.integer  "upvotes",             default: 0
    t.integer  "downvotes",           default: 0
    t.integer  "total_votes",         default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artist_micropost_comments", ["artist_id"], name: "index_artist_micropost_comments_on_artist_id"
  add_index "artist_micropost_comments", ["artist_micropost_id"], name: "index_artist_micropost_comments_on_artist_micropost_id"
  add_index "artist_micropost_comments", ["artist_name"], name: "index_artist_micropost_comments_on_artist_name"
  add_index "artist_micropost_comments", ["fan_id"], name: "index_artist_micropost_comments_on_fan_id"
  add_index "artist_micropost_comments", ["fan_name"], name: "index_artist_micropost_comments_on_fan_name"

  create_table "artist_micropost_votes", force: true do |t|
    t.integer  "artist_id"
    t.integer  "fan_id"
    t.integer  "artist_micropost_id"
    t.integer  "upvote",              default: 0
    t.integer  "downvote",            default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artist_micropost_votes", ["artist_id"], name: "index_artist_micropost_votes_on_artist_id"
  add_index "artist_micropost_votes", ["artist_micropost_id"], name: "index_artist_micropost_votes_on_artist_micropost_id"
  add_index "artist_micropost_votes", ["downvote"], name: "index_artist_micropost_votes_on_downvote"
  add_index "artist_micropost_votes", ["fan_id"], name: "index_artist_micropost_votes_on_fan_id"
  add_index "artist_micropost_votes", ["upvote"], name: "index_artist_micropost_votes_on_upvote"

  create_table "artist_microposts", force: true do |t|
    t.integer  "artist_id"
    t.text     "content"
    t.integer  "upvotes",     default: 0
    t.integer  "downvotes",   default: 0
    t.integer  "total_votes", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artist_microposts", ["artist_id"], name: "index_artist_microposts_on_artist_id"

  create_table "artist_profiles", force: true do |t|
    t.integer  "artist_id"
    t.text     "biography",       default: ""
    t.string   "genre",           default: ""
    t.string   "location",        default: ""
    t.string   "members",         default: ""
    t.string   "facebook_url",    default: ""
    t.string   "twitter_url",     default: ""
    t.string   "youtube_url",     default: ""
    t.string   "itunes_url",      default: ""
    t.string   "amazon_url",      default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "google_play_url", default: ""
    t.string   "record_label",    default: ""
    t.string   "cover_image",     default: ""
    t.string   "profile_image",   default: ""
  end

  add_index "artist_profiles", ["artist_id"], name: "index_artist_profiles_on_artist_id", unique: true

  create_table "artist_shows", force: true do |t|
    t.integer  "artist_id"
    t.integer  "show_month"
    t.integer  "show_day"
    t.integer  "show_year"
    t.string   "show_location"
    t.string   "show_venue"
    t.string   "show_ticket_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artist_shows", ["artist_id"], name: "index_artist_shows_on_artist_id"

  create_table "artist_tracks", force: true do |t|
    t.integer  "artist_id"
    t.integer  "artist_album_id"
    t.integer  "track_number"
    t.string   "track_name"
    t.string   "track_artist"
    t.string   "track_url"
    t.text     "track_lyrics"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artist_tracks", ["artist_album_id"], name: "index_artist_tracks_on_artist_album_id"
  add_index "artist_tracks", ["artist_id"], name: "index_artist_tracks_on_artist_id"
  add_index "artist_tracks", ["track_number"], name: "index_artist_tracks_on_track_number"

  create_table "artist_videos", force: true do |t|
    t.integer  "artist_id"
    t.string   "video_title"
    t.text     "video_description"
    t.string   "youtube_video_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artist_videos", ["artist_id"], name: "index_artist_videos_on_artist_id"

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

  create_table "fan_profiles", force: true do |t|
    t.integer  "fan_id"
    t.text     "biography",     default: ""
    t.string   "location",      default: ""
    t.string   "website",       default: ""
    t.string   "cover_image",   default: ""
    t.string   "profile_image", default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fan_profiles", ["fan_id"], name: "index_fan_profiles_on_fan_id", unique: true

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

  create_table "relationships", force: true do |t|
    t.integer  "fan_id"
    t.integer  "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["artist_id"], name: "index_relationships_on_artist_id"
  add_index "relationships", ["fan_id", "artist_id"], name: "index_relationships_on_fan_id_and_artist_id", unique: true
  add_index "relationships", ["fan_id"], name: "index_relationships_on_fan_id"

end
