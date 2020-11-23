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

ActiveRecord::Schema.define(version: 2020_11_23_172056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "forms", force: :cascade do |t|
    t.bigint "trip_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trip_id"], name: "index_forms_on_trip_id"
    t.index ["user_id"], name: "index_forms_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "quantity"
    t.string "description"
    t.bigint "receipt_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "price_cents", default: 0, null: false
    t.index ["receipt_id"], name: "index_items_on_receipt_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.string "shop"
    t.string "shop_vat_no"
    t.string "shop_address"
    t.string "transaction_no"
    t.date "date"
    t.bigint "trip_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "total_cents", default: 0, null: false
    t.integer "total_excl_vat_cents", default: 0, null: false
    t.index ["trip_id"], name: "index_receipts_on_trip_id"
    t.index ["user_id"], name: "index_receipts_on_user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.date "arrival_date"
    t.date "departure_date"
    t.string "final_destination"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "passport_no"
    t.string "passport_country"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "forms", "trips"
  add_foreign_key "forms", "users"
  add_foreign_key "items", "receipts"
  add_foreign_key "receipts", "trips"
  add_foreign_key "receipts", "users"
  add_foreign_key "trips", "users"
end
