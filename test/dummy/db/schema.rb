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

ActiveRecord::Schema.define(version: 20140317031517) do

  create_table "assumeds", force: true do |t|
    t.integer  "relation_id"
    t.string   "username"
    t.string   "full_name"
    t.string   "fname"
    t.string   "lastname"
    t.string   "middle_initial"
    t.string   "email"
    t.string   "phone"
    t.string   "company"
    t.string   "not_assumed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seededs", force: true do |t|
    t.string   "string_field"
    t.text     "text_field"
    t.integer  "integer_field"
    t.float    "float_field"
    t.decimal  "decimal_field"
    t.datetime "datetime_field"
    t.datetime "timestamp_field"
    t.time     "time_field"
    t.date     "date_field"
    t.boolean  "boolean_field"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
