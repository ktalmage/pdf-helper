# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_16_161509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "ein"
    t.integer "user_id"
  end

  create_table "investments", force: :cascade do |t|
    t.string "name"
    t.string "ein"
    t.decimal "ordinary_income"
    t.decimal "interest_income"
    t.decimal "st_capital"
    t.decimal "mt_capital"
    t.decimal "lt_capital"
    t.bigint "user_id"
    t.bigint "client_id"
    t.index ["client_id"], name: "index_investments_on_client_id"
    t.index ["user_id"], name: "index_investments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "investments", "clients"
  add_foreign_key "investments", "users"
end
