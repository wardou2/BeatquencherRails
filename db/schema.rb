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

ActiveRecord::Schema.define(version: 2019_06_14_203222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "instrument_presets", force: :cascade do |t|
    t.string "ins_type"
    t.string "name"
    t.jsonb "options"
    t.jsonb "effects", default: [], array: true
  end

  create_table "instruments", force: :cascade do |t|
    t.bigint "project_id"
    t.string "ins_type"
    t.string "name"
    t.jsonb "options"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "effects", default: [], array: true
    t.index ["project_id"], name: "index_instruments_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.integer "tempo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scenes", force: :cascade do |t|
    t.bigint "project_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_scenes_on_project_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.bigint "scene_id"
    t.bigint "instrument_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "notes", default: ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""], array: true
    t.index ["instrument_id"], name: "index_tracks_on_instrument_id"
    t.index ["scene_id"], name: "index_tracks_on_scene_id"
  end

  create_table "user_projects", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_user_projects_on_project_id"
    t.index ["user_id"], name: "index_user_projects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "google_token"
    t.string "google_refresh_token"
  end

  add_foreign_key "instruments", "projects"
  add_foreign_key "scenes", "projects"
  add_foreign_key "tracks", "instruments"
  add_foreign_key "tracks", "scenes"
  add_foreign_key "user_projects", "projects"
  add_foreign_key "user_projects", "users"
end
