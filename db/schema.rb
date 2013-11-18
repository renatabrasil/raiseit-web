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

ActiveRecord::Schema.define(version: 20131118185730) do

  create_table "cities", force: true do |t|
    t.string   "name",       limit: 100
    t.boolean  "capital",                default: false, null: false
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string   "name",       limit: 100
    t.string   "acronym",    limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enrollments", force: true do |t|
    t.datetime "start_date"
    t.string   "note",             limit: 500
    t.decimal  "value",                        precision: 6, scale: 2
    t.decimal  "registration_fee",             precision: 6, scale: 2
    t.decimal  "discount",                     precision: 6, scale: 2
    t.integer  "modality_id"
    t.integer  "periodicity_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entry_records", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "person_id"
  end

  create_table "localities", force: true do |t|
    t.string   "address",      limit: 300
    t.string   "district",     limit: 100
    t.float    "latitude"
    t.float    "longitude"
    t.string   "cep",          limit: 20
    t.integer  "address_id"
    t.string   "address_type"
    t.integer  "city_id"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "modalities", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "person_id"
  end

  create_table "people", force: true do |t|
    t.string   "type"
    t.string   "name",               limit: 300
    t.string   "cpf",                limit: 30
    t.string   "cnpj",               limit: 30
    t.string   "rg",                 limit: 30
    t.string   "inscricao_estadual", limit: 80
    t.string   "email",              limit: 200
    t.string   "gender",             limit: 1
    t.string   "phone1",             limit: 20
    t.string   "phone2",             limit: 20
    t.string   "enrollment",         limit: 30
    t.integer  "type_employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periodicities", force: true do |t|
    t.string   "description", limit: 120
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "states", force: true do |t|
    t.string   "name",       limit: 100
    t.string   "acronym",    limit: 8
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "type_employees", force: true do |t|
    t.string   "name",       limit: 60
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.integer  "user_account_id"
    t.string   "user_account_type"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username",               limit: 80
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "workouts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
