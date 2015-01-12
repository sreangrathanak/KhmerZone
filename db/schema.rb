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

ActiveRecord::Schema.define(version: 20150109022619) do

  create_table "categories", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "product_comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_comments", ["product_id"], name: "index_product_comments_on_product_id", using: :btree
  add_index "product_comments", ["user_id", "product_id"], name: "index_product_comments_on_user_id_and_product_id", unique: true, using: :btree
  add_index "product_comments", ["user_id"], name: "index_product_comments_on_user_id", using: :btree

  create_table "product_rates", force: true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_rates", ["product_id"], name: "index_product_rates_on_product_id", using: :btree
  add_index "product_rates", ["user_id", "product_id"], name: "index_product_rates_on_user_id_and_product_id", unique: true, using: :btree
  add_index "product_rates", ["user_id"], name: "index_product_rates_on_user_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "price",       limit: 24
    t.float    "discount",    limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "picture"
    t.integer  "category_id"
  end

  add_index "products", ["name"], name: "index_products_on_name", using: :btree

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree

end
