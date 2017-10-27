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

ActiveRecord::Schema.define(version: 20170917135936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "binoculars", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "brand"
    t.text "description"
    t.integer "magnifications"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["magnifications"], name: "index_binoculars_on_magnifications"
    t.index ["name"], name: "index_binoculars_on_name"
  end

  create_table "celestial_bodies", force: :cascade do |t|
    t.string "name"
    t.string "typology"
    t.float "size"
    t.string "constellation"
    t.integer "map_chart_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eyepieces", id: :serial, force: :cascade do |t|
    t.string "name"
    t.decimal "focal_length"
    t.decimal "ocular"
    t.decimal "apparent_fov"
    t.decimal "size"
    t.text "description"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "brand"
    t.index ["apparent_fov"], name: "index_eyepieces_on_apparent_fov"
    t.index ["focal_length"], name: "index_eyepieces_on_focal_length"
    t.index ["name"], name: "index_eyepieces_on_name"
    t.index ["ocular"], name: "index_eyepieces_on_ocular"
    t.index ["size"], name: "index_eyepieces_on_size"
  end

  create_table "filters", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "brand"
    t.text "description"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "observations", force: :cascade do |t|
    t.datetime "start_time"
    t.string "description"
    t.boolean "completed"
    t.integer "rating"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "celestial_body_id"
    t.bigint "observative_session_id"
    t.index ["celestial_body_id"], name: "index_observations_on_celestial_body_id"
    t.index ["observative_session_id"], name: "index_observations_on_observative_session_id"
    t.index ["user_id"], name: "index_observations_on_user_id"
  end

  create_table "observative_sessions", force: :cascade do |t|
    t.string "name"
    t.integer "category"
    t.datetime "start"
    t.datetime "end"
    t.integer "antoniadi"
    t.integer "pickering"
    t.integer "sky_transparency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_observative_sessions_on_user_id"
  end

  create_table "telescopes", id: :serial, force: :cascade do |t|
    t.string "brand"
    t.string "name"
    t.text "description"
    t.text "notes"
    t.float "angular_resolution"
    t.float "magnitude"
    t.float "focal_ratio"
    t.integer "finderscope"
    t.integer "focal_length"
    t.integer "mount"
    t.integer "aperture"
    t.string "typology"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.string "name"
    t.string "surname"
    t.date "birth"
    t.date "subscription_expiration"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "observations", "celestial_bodies"
  add_foreign_key "observations", "observative_sessions"
  add_foreign_key "observations", "users"
  add_foreign_key "observative_sessions", "users"
end
