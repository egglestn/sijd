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

ActiveRecord::Schema.define(version: 2021_07_23_101108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conditions", force: :cascade do |t|
    t.string "name"
    t.text "description"
  end

  create_table "medicines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.integer "location"
    t.integer "side"
    t.integer "spreads"
    t.bigint "condition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["condition_id"], name: "index_records_on_condition_id"
  end

  create_table "records_activities", id: false, force: :cascade do |t|
    t.bigint "activity_id"
    t.bigint "record_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_records_activities_on_activity_id"
    t.index ["record_id"], name: "index_records_activities_on_record_id"
  end

  create_table "records_medicines", id: false, force: :cascade do |t|
    t.bigint "medicine_id"
    t.bigint "record_id"
    t.integer "score"
    t.integer "side_effects"
    t.integer "diminishing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medicine_id"], name: "index_records_medicines_on_medicine_id"
    t.index ["record_id"], name: "index_records_medicines_on_record_id"
  end

  create_table "records_treatments", id: false, force: :cascade do |t|
    t.bigint "treatment_id"
    t.bigint "record_id"
    t.integer "score"
    t.integer "side_effects"
    t.integer "diminishing"
    t.integer "recovery"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_id"], name: "index_records_treatments_on_record_id"
    t.index ["treatment_id"], name: "index_records_treatments_on_treatment_id"
  end

  create_table "records_vitamins", id: false, force: :cascade do |t|
    t.bigint "vitamin_id"
    t.bigint "record_id"
    t.integer "score"
    t.integer "side_effects"
    t.integer "diminishing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_id"], name: "index_records_vitamins_on_record_id"
    t.index ["vitamin_id"], name: "index_records_vitamins_on_vitamin_id"
  end

  create_table "treatments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vitamins", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "records_activities", "activities"
  add_foreign_key "records_activities", "records"
  add_foreign_key "records_medicines", "medicines"
  add_foreign_key "records_medicines", "records"
  add_foreign_key "records_treatments", "records"
  add_foreign_key "records_treatments", "treatments"
  add_foreign_key "records_vitamins", "records"
  add_foreign_key "records_vitamins", "vitamins"
end
