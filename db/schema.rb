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

ActiveRecord::Schema.define(version: 20170419001052) do

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token"
    t.integer  "user_id",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_api_keys_on_user_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string   "holder_name",      limit: 120, null: false
    t.string   "number",           limit: 4,   null: false
    t.integer  "expiration_month",             null: false
    t.integer  "expiration_year",              null: false
    t.string   "brand",            limit: 75,  null: false
    t.integer  "user_id",                      null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 120, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "lastname"
    t.integer  "store_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "offers", force: :cascade do |t|
    t.string   "description"
    t.string   "image"
    t.datetime "expiration"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id",      null: false
    t.integer  "store_id",     null: false
    t.integer  "order_status", null: false
    t.integer  "price",        null: false
    t.datetime "pickup",       null: false
    t.datetime "received"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "card_id"
    t.integer  "method"
  end

  create_table "product_orders", force: :cascade do |t|
    t.integer  "product_id", null: false
    t.integer  "order_id",   null: false
    t.integer  "quantity",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_stores", force: :cascade do |t|
    t.integer  "store_id",               null: false
    t.integer  "product_id",             null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "quantity",   default: 0
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "price",       null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer  "platform",   limit: 1, null: false
    t.datetime "deleted_at"
    t.integer  "user_id",              null: false
    t.integer  "api_key_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["api_key_id"], name: "index_sessions_on_api_key_id"
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string   "name",                                         null: false
    t.string   "address",                                      null: false
    t.time     "opening_hour",                                 null: false
    t.time     "closing_hour",                                 null: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "phone"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.decimal  "longitude",            precision: 8, scale: 6
    t.decimal  "latitude",             precision: 8, scale: 6
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "lastname"
    t.integer  "points"
    t.integer  "sex"
    t.integer  "age"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
