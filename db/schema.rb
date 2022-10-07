# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_07_170713) do
  create_table "active_sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.string "ip_address"
    t.string "remember_token", null: false
    t.index ["remember_token"], name: "index_active_sessions_on_remember_token", unique: true
    t.index ["user_id"], name: "index_active_sessions_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "receiver_id"
    t.index ["receiver_id"], name: "index_categories_on_receiver_id"
  end

  create_table "discards", force: :cascade do |t|
    t.string "description"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_discards_on_user_id"
  end

  create_table "receivers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.boolean "condition"
    t.boolean "truly_linfo"
    t.integer "cep"
    t.string "state"
    t.string "city"
    t.string "street"
    t.integer "number"
    t.string "complement"
    t.boolean "approved"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "residues", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.text "content"
    t.text "description"
    t.string "link"
    t.string "buttonContent"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "provider"
    t.boolean "blocked"
    t.datetime "confirmed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "unconfirmed_email"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_sessions", "users", on_delete: :cascade
end
