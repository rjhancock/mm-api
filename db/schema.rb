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

ActiveRecord::Schema.define(version: 2020_03_23_225527) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.string "chapter"
    t.date "chapter_date"
    t.bigint "system_id"
    t.bigint "novel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["novel_id"], name: "index_chapters_on_novel_id"
    t.index ["system_id"], name: "index_chapters_on_system_id"
  end

  create_table "component_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_component_types_on_name"
  end

  create_table "components", force: :cascade do |t|
    t.string "name"
    t.bigint "component_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["component_type_id"], name: "index_components_on_component_type_id"
    t.index ["name", "component_type_id"], name: "index_components_on_name_and_component_type_id"
  end

  create_table "components_factories", id: false, force: :cascade do |t|
    t.bigint "component_id"
    t.bigint "factory_id"
    t.index ["component_id"], name: "index_components_factories_on_component_id"
    t.index ["factory_id"], name: "index_components_factories_on_factory_id"
  end

  create_table "factories", force: :cascade do |t|
    t.string "name"
    t.bigint "system_id"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "url"], name: "index_factories_on_name_and_url"
    t.index ["system_id"], name: "index_factories_on_system_id"
  end

  create_table "factories_units", id: false, force: :cascade do |t|
    t.bigint "factory_id", null: false
    t.bigint "unit_id", null: false
    t.index ["factory_id", "unit_id"], name: "index_factories_units_on_factory_id_and_unit_id", unique: true
  end

  create_table "novels", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "author_id"
    t.string "series"
    t.date "prologue_date"
    t.date "start_date"
    t.date "end_date"
    t.date "epilogue_date"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_novels_on_author_id"
  end

  create_table "publications", force: :cascade do |t|
    t.integer "stock_number"
    t.string "isbn"
    t.integer "year"
    t.decimal "price"
    t.bigint "publisher_id"
    t.bigint "novel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["novel_id"], name: "index_publications_on_novel_id"
    t.index ["publisher_id"], name: "index_publications_on_publisher_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "servers", force: :cascade do |t|
    t.integer "port"
    t.string "ip_address"
    t.boolean "passworded"
    t.text "users"
    t.string "server_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "version"
    t.string "phase"
    t.string "motd"
    t.index ["server_key"], name: "index_servers_on_server_key", unique: true
  end

  create_table "system_occupation_dates", force: :cascade do |t|
    t.string "faction"
    t.date "occupation_start"
    t.bigint "system_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["system_id"], name: "index_system_occupation_dates_on_system_id"
  end

  create_table "system_owner_eras", force: :cascade do |t|
    t.integer "era"
    t.string "faction"
    t.bigint "system_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["system_id"], name: "index_system_owner_eras_on_system_id"
  end

  create_table "systems", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "coords_x"
    t.decimal "coords_y"
    t.string "time_to_jump"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "url"], name: "index_systems_on_name_and_url"
  end

  create_table "systems_units", id: false, force: :cascade do |t|
    t.bigint "system_id", null: false
    t.bigint "unit_id", null: false
    t.index ["system_id", "unit_id"], name: "index_systems_units_on_system_id_and_unit_id", unique: true
  end

  create_table "units", force: :cascade do |t|
    t.string "title"
    t.string "source_file_name"
    t.integer "unit_type", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "appearance"
    t.string "armament"
    t.string "armor_type"
    t.string "available"
    t.string "communication_system"
    t.string "config"
    t.string "cruise_speed"
    t.string "jump_jets"
    t.string "maximum_speed"
    t.string "power_plant"
    t.string "rules"
    t.string "source"
    t.string "targeting_tracking_system"
    t.string "tech_level"
    t.string "tonnage"
    t.string "used_by"
    t.text "overview"
    t.text "capabilites"
    t.text "deployment"
    t.text "notable_units"
    t.text "mechwarrior_rules"
    t.index ["title"], name: "index_units_on_title"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "components", "component_types"
  add_foreign_key "factories", "systems"
  add_foreign_key "system_occupation_dates", "systems"
  add_foreign_key "system_owner_eras", "systems"
end
