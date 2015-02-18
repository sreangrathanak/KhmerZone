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

ActiveRecord::Schema.define(version: 20150215162542) do

  create_table "categories", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "images", force: true do |t|
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "main_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "main_sub_categories", force: true do |t|
    t.integer  "main_category_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.integer  "sender_id"
    t.string   "subject"
    t.boolean  "unread",     default: true
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reciver_id"
  end

  add_index "messages", ["reciver_id"], name: "index_messages_on_reciver_id", using: :btree
  add_index "messages", ["sender_id"], name: "index_messages_on_sender_id", using: :btree

  create_table "notifications", force: true do |t|
    t.integer  "notified_id"
    t.integer  "notifier_id"
    t.boolean  "ischeck",     default: false
    t.boolean  "isread",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "information"
  end

  add_index "notifications", ["notified_id"], name: "index_notifications_on_notified_id", using: :btree
  add_index "notifications", ["notifier_id"], name: "index_notifications_on_notifier_id", using: :btree

  create_table "product_categories", force: true do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_comments", ["product_id"], name: "index_product_comments_on_product_id", using: :btree
  add_index "product_comments", ["user_id"], name: "index_product_comments_on_user_id", using: :btree

  create_table "product_images", force: true do |t|
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_id"
  end

  create_table "product_likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_likes", ["product_id"], name: "index_product_likes_on_product_id", using: :btree
  add_index "product_likes", ["user_id", "product_id"], name: "index_product_likes_on_user_id_and_product_id", unique: true, using: :btree
  add_index "product_likes", ["user_id"], name: "index_product_likes_on_user_id", using: :btree

  create_table "product_rates", force: true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "rate",       default: 0
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

  create_table "searches", force: true do |t|
    t.string   "keywords"
    t.integer  "category_id"
    t.decimal  "min_price",   precision: 10, scale: 0
    t.decimal  "max_price",   precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shops", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "about"
    t.string   "phones"
    t.string   "location"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_categories", force: true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_shops", force: true do |t|
    t.integer  "user_id"
    t.integer  "shop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_digest"
    t.string   "image"
    t.string   "store_name"
    t.string   "url_name"
    t.string   "phone"
    t.string   "address"
    t.text     "about"
    t.boolean  "isadmin",         default: false
    t.integer  "location_id",     default: 1
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree

end
