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

ActiveRecord::Schema.define(version: 20170712030832) do

  create_table "pictures", force: true do |t|
    t.string   "picture",      limit: nil
    t.text     "description"
    t.string   "name",         limit: nil
    t.string   "picture_type", limit: nil
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "reservations", force: true do |t|
    t.string   "email",              limit: nil
    t.string   "phone_num",          limit: nil
    t.string   "first_name",         limit: nil
    t.string   "last_name",          limit: nil
    t.string   "zip_from",           limit: nil
    t.string   "zip_to",             limit: nil
    t.integer  "reservation_number"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

end
