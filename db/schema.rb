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

ActiveRecord::Schema.define(version: 20150826205503) do

  create_table "budgets", force: :cascade do |t|
    t.integer  "category_id",  limit: 4
    t.date     "budget_month",                                   null: false
    t.decimal  "amount",                 precision: 8, scale: 2, null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "budgets", ["category_id", "budget_month"], name: "by_category_month", unique: true, using: :btree
  add_index "budgets", ["category_id"], name: "index_budgets_on_category_id", using: :btree

  create_table "budgets_spendings", id: false, force: :cascade do |t|
    t.integer "spending_id", limit: 4
    t.integer "budget_id",   limit: 4
  end

  add_index "budgets_spendings", ["budget_id"], name: "index_budgets_spendings_on_budget_id", using: :btree
  add_index "budgets_spendings", ["spending_id"], name: "index_budgets_spendings_on_spending_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255, null: false
    t.string   "description", limit: 255, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "spendings", force: :cascade do |t|
    t.string   "description",   limit: 255,                         null: false
    t.integer  "category_id",   limit: 4,                           null: false
    t.date     "spending_date",                                     null: false
    t.decimal  "amount",                    precision: 8, scale: 2, null: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "budget_id",     limit: 4
  end

  add_index "spendings", ["budget_id"], name: "index_spendings_on_budget_id", using: :btree
  add_index "spendings", ["category_id"], name: "index_spendings_on_category_id", using: :btree
  add_index "spendings", ["spending_date"], name: "index_spendings_on_spending_date", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",        limit: 255
    t.string   "last_name",         limit: 255
    t.string   "email",             limit: 255
    t.string   "username",          limit: 255
    t.string   "password_digest",   limit: 255
    t.string   "remember_digest",   limit: 255
    t.string   "activation_digest", limit: 255
    t.boolean  "activated"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "budgets", "categories"
  add_foreign_key "spendings", "budgets"
  add_foreign_key "spendings", "categories"
end
