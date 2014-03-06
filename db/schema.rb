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

ActiveRecord::Schema.define(version: 20140306202311) do

  create_table "grant_applications", force: true do |t|
    t.integer  "request_amount"
    t.text     "intended_use"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment"
    t.text     "comments"
    t.string   "status",         default: "Review Pending"
    t.integer  "rating"
    t.integer  "program_ids"
    t.string   "grant_types",    default: [],               array: true
  end

  add_index "grant_applications", ["user_id"], name: "index_grant_applications_on_user_id", using: :btree

  create_table "grant_applications_programs", id: false, force: true do |t|
    t.integer "grant_application_id"
    t.integer "program_id"
  end

  create_table "organizations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "programs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "description"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "middle_initial"
    t.string   "last_name"
    t.string   "role_in_org"
    t.string   "email"
    t.string   "password_digest"
    t.string   "phone_number"
    t.string   "org_website"
    t.text     "about"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",        default: false
    t.string   "username"
    t.integer  "organization_id"
  end

end
