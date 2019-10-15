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

ActiveRecord::Schema.define(version: 2019_06_03_103638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fixpoint_attachments", force: :cascade do |t|
    t.string "photo"
    t.bigint "fixpoint_id"
    t.boolean "fixed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fixpoint_id"], name: "index_fixpoint_attachments_on_fixpoint_id"
  end

  create_table "fixpoints", force: :cascade do |t|
    t.boolean "fixed", default: false
    t.date "fix_date"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category"
    t.bigint "user_id"
    t.string "address"
    t.index ["user_id"], name: "index_fixpoints_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "fixpoint_id"
    t.index ["fixpoint_id"], name: "index_votes_on_fixpoint_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "fixpoint_attachments", "fixpoints"
  add_foreign_key "fixpoints", "users"
  add_foreign_key "votes", "fixpoints"
  add_foreign_key "votes", "users"
end
