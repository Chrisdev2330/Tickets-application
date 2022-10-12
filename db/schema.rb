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

ActiveRecord::Schema[7.0].define(version: 2022_10_06_171114) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "ticket_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_comments_on_ticket_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name", null: false
    t.string "lastname", null: false
    t.string "phone", null: false
    t.string "address"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "technicals", force: :cascade do |t|
    t.string "name", null: false
    t.string "lastname", null: false
    t.string "phone", null: false
    t.string "address"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_technicals_on_user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "problem", null: false
    t.text "description", null: false
    t.integer "case", null: false
    t.integer "level", null: false
    t.integer "status", default: 0
    t.bigint "building_id", null: false
    t.bigint "user_id", null: false
    t.bigint "technical_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_tickets_on_building_id"
    t.index ["technical_id"], name: "index_tickets_on_technical_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email"
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rol"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "comments", "tickets"
  add_foreign_key "comments", "users"
  add_foreign_key "customers", "users"
  add_foreign_key "technicals", "users"
  add_foreign_key "tickets", "buildings"
  add_foreign_key "tickets", "technicals"
  add_foreign_key "tickets", "users"
end
