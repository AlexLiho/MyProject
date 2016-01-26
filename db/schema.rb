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

ActiveRecord::Schema.define(version: 20160116232515) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "order_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.boolean  "additional",  default: false
    t.integer  "quantity",                    null: false
    t.integer  "price",       default: 0,     null: false
    t.text     "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.datetime "deleted_at"
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "name",                        null: false
    t.string   "phone",                       null: false
    t.string   "email",                       null: false
    t.string   "variant",                     null: false
    t.boolean  "eco",         default: false
    t.boolean  "get_key",     default: false
    t.text     "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.datetime "deleted_at"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                          null: false
    t.boolean  "additional",    default: false
    t.integer  "price",                         null: false
    t.string   "unit",                          null: false
    t.integer  "lead_time"
    t.text     "description"
    t.integer  "visible_order",                 null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.datetime "deleted_at"
  end

end
