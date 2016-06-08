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

ActiveRecord::Schema.define(version: 20160608180435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "badges", force: :cascade do |t|
    t.string   "name"
    t.integer  "stars",            default: 1
    t.integer  "scout_id"
    t.datetime "opened_at",        default: '2016-06-07 23:44:37'
    t.datetime "closed_at"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "closing_order_id"
    t.integer  "opening_order_id"
  end

  add_index "badges", ["closing_order_id"], name: "index_badges_on_closing_order_id", using: :btree
  add_index "badges", ["opening_order_id"], name: "index_badges_on_opening_order_id", using: :btree
  add_index "badges", ["scout_id"], name: "index_badges_on_scout_id", using: :btree

  create_table "leaders", force: :cascade do |t|
    t.integer  "leader_rank", default: 0
    t.string   "phone"
    t.string   "courses",     default: [],              array: true
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "troop_id"
  end

  add_index "leaders", ["troop_id"], name: "index_leaders_on_troop_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.boolean  "open",        default: true
    t.integer  "number"
    t.datetime "finished_at"
    t.string   "quote"
    t.integer  "troop_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "orders", ["troop_id"], name: "index_orders_on_troop_id", using: :btree

  create_table "patrol_leaders", force: :cascade do |t|
    t.string   "phone"
    t.string   "course"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "patrol_id"
  end

  add_index "patrol_leaders", ["patrol_id"], name: "index_patrol_leaders_on_patrol_id", using: :btree

  create_table "patrols", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "troop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "patrols", ["troop_id"], name: "index_patrols_on_troop_id", using: :btree

  create_table "scouts", force: :cascade do |t|
    t.string   "first_name",                           null: false
    t.string   "last_name",                            null: false
    t.string   "pesel"
    t.string   "address"
    t.string   "mothers_name"
    t.string   "fathers_name"
    t.integer  "rank"
    t.string   "position",       default: "Szeregowa"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "scoutable_id"
    t.string   "scoutable_type"
    t.integer  "patrol_id"
  end

  create_table "troops", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "full_name",  null: false
    t.integer  "number"
    t.string   "patron"
    t.string   "district"
    t.string   "region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.integer  "accountable_id"
    t.string   "accountable_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
