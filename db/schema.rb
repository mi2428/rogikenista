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

ActiveRecord::Schema.define(version: 20160819191907) do

  create_table "charges", force: :cascade do |t|
    t.string   "name",              null: false
    t.integer  "user_id",           null: false
    t.integer  "group_id",          null: false
    t.integer  "year"
    t.text     "description"
    t.date     "inauguration_date"
    t.date     "retirement_date"
    t.text     "retirement_reason"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["group_id"], name: "index_charges_on_group_id"
    t.index ["name", "user_id", "group_id", "year"], name: "index_charges_on_name_and_user_id_and_group_id_and_year", unique: true
    t.index ["user_id"], name: "index_charges_on_user_id"
  end

  create_table "contact_tools", force: :cascade do |t|
    t.string "name",        null: false
    t.text   "description"
    t.index ["name"], name: "index_contact_tools_on_name", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "user_id",         null: false
    t.integer  "contact_tool_id", null: false
    t.string   "data",            null: false
    t.text     "description"
    t.text     "expiration_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["contact_tool_id"], name: "index_contacts_on_contact_tool_id"
    t.index ["user_id", "contact_tool_id", "data"], name: "index_contacts_on_user_id_and_contact_tool_id_and_data", unique: true
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "group_users", force: :cascade do |t|
    t.integer  "group_id",          null: false
    t.integer  "user_id",           null: false
    t.date     "entrance_date",     null: false
    t.date     "withdrawal_date"
    t.text     "withdrawal_reason"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["group_id", "user_id", "entrance_date"], name: "index_group_users_on_group_id_and_user_id_and_entrance_date", unique: true
    t.index ["group_id"], name: "index_group_users_on_group_id"
    t.index ["user_id"], name: "index_group_users_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name",              null: false
    t.text     "description"
    t.date     "inauguration_date"
    t.date     "breakup_date"
    t.text     "breakup_reason"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["name"], name: "index_groups_on_name"
  end

  create_table "user_types", force: :cascade do |t|
    t.string "name",        null: false
    t.string "description"
    t.index ["name"], name: "index_user_types_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.integer  "user_type_id",        null: false
    t.string   "real_name"
    t.string   "real_name_pron"
    t.string   "screen_name",         null: false
    t.integer  "entrance_year"
    t.text     "affiliation_outside"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["real_name"], name: "index_users_on_real_name"
    t.index ["real_name_pron"], name: "index_users_on_real_name_pron"
    t.index ["screen_name"], name: "index_users_on_screen_name"
    t.index ["user_type_id"], name: "index_users_on_user_type_id"
  end

end
