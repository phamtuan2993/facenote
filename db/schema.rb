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

ActiveRecord::Schema.define(version: 20180110164814) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "posts", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "author_id",  null: false
  end

  add_index "posts", ["author_id"], name: "index_posts_on_author_id", using: :btree

  create_table "relationships", id: false, force: :cascade do |t|
    t.integer  "following_id"
    t.string   "following_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "follower_id"
  end

  add_index "relationships", ["follower_id", "following_id", "following_type"], name: "index_relationships_on_follower_and_following", unique: true, using: :btree
  add_index "relationships", ["following_type", "following_id"], name: "index_relationships_on_following_type_and_following_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "posts", "users", column: "author_id"
  add_foreign_key "relationships", "users", column: "follower_id"
end
