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

ActiveRecord::Schema[7.1].define(version: 2024_05_20_170847) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "itineraries", force: :cascade do |t|
    t.string "status"
    t.string "day"
    t.string "h_start"
    t.string "h_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "starting_place_id", null: false
    t.bigint "ending_place_id", null: false
    t.index ["ending_place_id"], name: "index_itineraries_on_ending_place_id"
    t.index ["starting_place_id"], name: "index_itineraries_on_starting_place_id"
    t.index ["user_id"], name: "index_itineraries_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "section_groups", force: :cascade do |t|
    t.string "n_seats"
    t.string "cost"
    t.string "h_start"
    t.string "h_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "starting_place_id", null: false
    t.bigint "ending_place_id", null: false
    t.index ["ending_place_id"], name: "index_section_groups_on_ending_place_id"
    t.index ["starting_place_id"], name: "index_section_groups_on_starting_place_id"
    t.index ["user_id"], name: "index_section_groups_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.string "description"
    t.string "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "itineraries", "places", column: "ending_place_id"
  add_foreign_key "itineraries", "places", column: "starting_place_id"
  add_foreign_key "itineraries", "users"
  add_foreign_key "section_groups", "places", column: "ending_place_id"
  add_foreign_key "section_groups", "places", column: "starting_place_id"
  add_foreign_key "section_groups", "users"
end
