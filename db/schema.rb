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

ActiveRecord::Schema.define(version: 2019_01_13_211001) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "billboards", force: :cascade do |t|
    t.string "city", default: "", null: false
    t.string "street", default: "", null: false
    t.string "house", default: "", null: false
    t.float "price"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_billboards_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.integer "billboard_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["billboard_id"], name: "index_comments_on_billboard_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "rents", force: :cascade do |t|
    t.string "ad_type"
    t.string "brand"
    t.string "description"
    t.datetime "start"
    t.datetime "end"
    t.boolean "is_active", default: true
    t.integer "board_id"
    t.integer "user_id"
    t.integer "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_rents_on_request_id"
  end

  create_table "requests", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.string "brand"
    t.string "description"
    t.boolean "approved"
    t.integer "user_id"
    t.integer "billboard_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ad_type"
    t.index ["billboard_id"], name: "index_requests_on_billboard_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "provider"
    t.string "uid"
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.date "birthdate"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.bigint "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "phone"
    t.string "city"
    t.string "street"
    t.string "house"
    t.float "latitude"
    t.float "longitude"
    t.integer "locale"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
