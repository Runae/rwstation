# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160926164410) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.integer  "number"
    t.integer  "upper"
    t.integer  "lower"
    t.integer  "train_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "side_upper"
    t.integer  "side_lower"
    t.integer  "sit"
    t.string   "type"
  end

  add_index "cars", ["train_id", "type"], name: "index_cars_on_train_id_and_type", using: :btree

  create_table "railway_stations", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer "railway_station_id"
    t.integer "route_id"
    t.integer "num"
    t.integer "position"
    t.time    "arrive"
    t.time    "depart"
  end

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "number"
    t.integer  "train_id"
    t.integer  "user_id"
    t.integer  "from_id"
    t.integer  "to_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "passenger"
    t.string   "passport"
  end

  add_index "tickets", ["from_id"], name: "index_tickets_on_from_id", using: :btree
  add_index "tickets", ["to_id"], name: "index_tickets_on_to_id", using: :btree
  add_index "tickets", ["train_id"], name: "index_tickets_on_train_id", using: :btree
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id", using: :btree

  create_table "trains", force: :cascade do |t|
    t.string   "number"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "route_id"
    t.integer  "current_station_id"
    t.boolean  "flag"
  end

  add_index "trains", ["current_station_id"], name: "index_trains_on_current_station_id", using: :btree
  add_index "trains", ["route_id"], name: "index_trains_on_route_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
