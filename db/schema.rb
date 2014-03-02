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

ActiveRecord::Schema.define(version: 20140302023747) do

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
  end

  add_index "grant_applications", ["user_id"], name: "index_grant_applications_on_user_id", using: :btree

  create_table "organizations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "payments", force: true do |t|
    t.integer  "subscription_id"
    t.string   "cc_info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "amount"
    t.date     "charge_date"
  end

  create_table "plans", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price"
  end

  create_table "subscriptions", force: true do |t|
    t.integer  "user_id"
    t.integer  "plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "next_payment_date"
    t.date     "signup_date"
    t.date     "cancel_date"
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
    t.boolean  "is_admin",              default: false
    t.string   "username"
    t.string   "stripe_customer_token"
    t.integer  "organization_id"
  end

end
