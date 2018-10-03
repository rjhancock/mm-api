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

ActiveRecord::Schema.define(version: 2018_10_03_041521) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "users", force: :cascade do |t|
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "components", "component_types"
  add_foreign_key "factories", "systems"
  add_foreign_key "system_occupation_dates", "systems"
  add_foreign_key "system_owner_eras", "systems"
end
