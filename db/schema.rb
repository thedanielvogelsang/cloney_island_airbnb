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

ActiveRecord::Schema.define(version: 20170712125634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bed_types", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cancellations", force: :cascade do |t|
    t.text "name"
    t.text "refund"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.integer "accomodates"
    t.integer "bathrooms"
    t.integer "bedrooms"
    t.integer "beds"
    t.float "price"
    t.text "house_rules"
    t.bigint "property_type_id"
    t.bigint "bed_type_id"
    t.bigint "pet_type_id"
    t.bigint "room_type_id"
    t.bigint "user_id"
    t.bigint "cancellation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bed_type_id"], name: "index_listings_on_bed_type_id"
    t.index ["cancellation_id"], name: "index_listings_on_cancellation_id"
    t.index ["pet_type_id"], name: "index_listings_on_pet_type_id"
    t.index ["property_type_id"], name: "index_listings_on_property_type_id"
    t.index ["room_type_id"], name: "index_listings_on_room_type_id"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "pet_types", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "property_types", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_types", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "birthday"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "listings", "bed_types"
  add_foreign_key "listings", "cancellations"
  add_foreign_key "listings", "pet_types"
  add_foreign_key "listings", "property_types"
  add_foreign_key "listings", "room_types"
  add_foreign_key "listings", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
