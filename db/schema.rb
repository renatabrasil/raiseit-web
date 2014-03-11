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

ActiveRecord::Schema.define(version: 20140227182227) do

  create_table "countries", force: true do |t|
    t.string   "name",       limit: 100
    t.string   "acronym",    limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: true do |t|
    t.string   "name",       limit: 100
    t.string   "acronym",    limit: 8
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["country_id"], :name => "fk__states_country_id"
    t.foreign_key ["country_id"], "countries", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_states_country_id"
  end

  create_table "cities", force: true do |t|
    t.string   "name",       limit: 100
    t.boolean  "capital",                default: false, null: false
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["state_id"], :name => "fk__cities_state_id"
    t.foreign_key ["state_id"], "states", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_cities_state_id"
  end

  create_table "modalities", force: true do |t|
    t.string   "name",       limit: 200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "type_employees", force: true do |t|
    t.string   "name",       limit: 60
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.integer  "type_employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["type_employee_id"], :name => "fk__people_type_employee_id"
    t.foreign_key ["type_employee_id"], "type_employees", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_people_type_employee_id"
  end

  create_table "class_gyms", force: true do |t|
    t.integer  "capacity"
    t.string   "code",          limit: 8
    t.datetime "start_date"
    t.string   "schedule",      limit: 200
    t.boolean  "open",                      default: true, null: false
    t.boolean  "active",                    default: true, null: false
    t.integer  "modality_id"
    t.integer  "instructor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["instructor_id"], :name => "fk__class_gyms_instructor_id"
    t.index ["modality_id"], :name => "fk__class_gyms_modality_id"
    t.foreign_key ["instructor_id"], "people", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_class_gyms_instructor_id"
    t.foreign_key ["modality_id"], "modalities", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_class_gyms_modality_id"
  end

  create_table "class_gyms_people", id: false, force: true do |t|
    t.integer "class_gym_id"
    t.integer "student_id"
    t.index ["class_gym_id"], :name => "fk__class_gyms_people_class_gym_id"
    t.index ["student_id"], :name => "fk__class_gyms_people_student_id"
    t.foreign_key ["class_gym_id"], "class_gyms", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_class_gyms_people_class_gym_id"
    t.foreign_key ["student_id"], "people", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_class_gyms_people_student_id"
  end

  create_table "periodicities", force: true do |t|
    t.string   "description", limit: 120
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enrollments", force: true do |t|
    t.datetime "start_date"
    t.string   "note",             limit: 500
    t.integer  "expiration_day",                                                      null: false
    t.decimal  "value",                        precision: 6, scale: 2
    t.decimal  "registration_fee",             precision: 6, scale: 2
    t.decimal  "discount",                     precision: 6, scale: 2
    t.boolean  "active",                                               default: true, null: false
    t.integer  "modality_id"
    t.integer  "periodicity_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["modality_id"], :name => "fk__enrollments_modality_id"
    t.index ["periodicity_id"], :name => "fk__enrollments_periodicity_id"
    t.index ["student_id"], :name => "fk__enrollments_student_id"
    t.foreign_key ["modality_id"], "modalities", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_enrollments_modality_id"
    t.foreign_key ["periodicity_id"], "periodicities", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_enrollments_periodicity_id"
    t.foreign_key ["student_id"], "people", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_enrollments_student_id"
  end

  create_table "entry_records", force: true do |t|
    t.datetime "entry_time"
    t.datetime "exit_time"
    t.integer  "individual_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["individual_id"], :name => "fk__entry_records_individual_id"
    t.foreign_key ["individual_id"], "people", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_entry_records_individual_id"
  end

  create_table "status_equipments", force: true do |t|
    t.string   "description", limit: 200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipment", force: true do |t|
    t.string   "description",         limit: 200
    t.integer  "quantity"
    t.integer  "status_equipment_id"
    t.integer  "modality_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["modality_id"], :name => "fk__equipment_modality_id"
    t.index ["status_equipment_id"], :name => "fk__equipment_status_equipment_id"
    t.foreign_key ["modality_id"], "modalities", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_equipment_modality_id"
    t.foreign_key ["status_equipment_id"], "status_equipments", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_equipment_status_equipment_id"
  end

  create_table "localities", force: true do |t|
    t.string   "address",      limit: 300
    t.string   "district",     limit: 100
    t.float    "latitude"
    t.float    "longitude"
    t.string   "zipcode",      limit: 20
    t.integer  "address_id"
    t.string   "address_type"
    t.integer  "city_id"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["city_id"], :name => "fk__localities_city_id"
    t.index ["state_id"], :name => "fk__localities_state_id"
    t.foreign_key ["city_id"], "cities", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_localities_city_id"
    t.foreign_key ["state_id"], "states", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_localities_state_id"
  end

  create_table "maintenance_types", force: true do |t|
    t.string   "description", limit: 200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maintenances", force: true do |t|
    t.datetime "date"
    t.decimal  "value",               precision: 6, scale: 2
    t.string   "technical_feedback"
    t.integer  "equipment_id"
    t.integer  "maintenance_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["equipment_id"], :name => "fk__maintenances_equipment_id"
    t.index ["maintenance_type_id"], :name => "fk__maintenances_maintenance_type_id"
    t.foreign_key ["equipment_id"], "equipment", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_maintenances_equipment_id"
    t.foreign_key ["maintenance_type_id"], "maintenance_types", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_maintenances_maintenance_type_id"
  end

  create_table "measure_units", force: true do |t|
    t.string   "description", limit: 200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "model_workout_sheets", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "months", force: true do |t|
    t.string   "name",         limit: 200
    t.string   "abbreviation", limit: 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.datetime "pay_day"
    t.integer  "account_id"
    t.string   "account_type"
    t.integer  "individual_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "value",         precision: 6, scale: 2
    t.index ["individual_id"], :name => "fk__payments_individual_id"
    t.foreign_key ["individual_id"], "people", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_payments_individual_id"
  end

  create_table "physical_assessment_types", force: true do |t|
    t.string   "description", limit: 200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "physical_assessments", force: true do |t|
    t.datetime "date"
    t.string   "measurer_feedback"
    t.integer  "student_id"
    t.integer  "instructor_id"
    t.integer  "physical_assessment_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["instructor_id"], :name => "fk__physical_assessments_instructor_id"
    t.index ["physical_assessment_type_id"], :name => "fk__physical_assessments_physical_assessment_type_id"
    t.index ["student_id"], :name => "fk__physical_assessments_student_id"
    t.foreign_key ["instructor_id"], "people", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_physical_assessments_instructor_id"
    t.foreign_key ["physical_assessment_type_id"], "physical_assessment_types", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_physical_assessments_physical_assessment_type_id"
    t.foreign_key ["student_id"], "people", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_physical_assessments_student_id"
  end

  create_table "physical_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "model_workout_sheet_id"
    t.index ["model_workout_sheet_id"], :name => "fk__physical_categories_model_workout_sheet_id"
    t.foreign_key ["model_workout_sheet_id"], "model_workout_sheets", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_physical_categories_model_workout_sheet_id"
  end

  create_table "physical_parameters", force: true do |t|
    t.string   "description", limit: 200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "physical_parameter_goals", force: true do |t|
    t.float    "value"
    t.integer  "physical_parameter_id"
    t.integer  "measure_unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["measure_unit_id"], :name => "fk__physical_parameter_goals_measure_unit_id"
    t.index ["physical_parameter_id"], :name => "fk__physical_parameter_goals_physical_parameter_id"
    t.foreign_key ["measure_unit_id"], "measure_units", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_physical_parameter_goals_measure_unit_id"
    t.foreign_key ["physical_parameter_id"], "physical_parameters", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_physical_parameter_goals_physical_parameter_id"
  end

  create_table "physical_parameter_measures", force: true do |t|
    t.float    "value"
    t.integer  "physical_parameter_id"
    t.integer  "measure_unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["measure_unit_id"], :name => "fk__physical_parameter_measures_measure_unit_id"
    t.index ["physical_parameter_id"], :name => "fk__physical_parameter_measures_physical_parameter_id"
    t.foreign_key ["measure_unit_id"], "measure_units", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_physical_parameter_measures_measure_unit_id"
    t.foreign_key ["physical_parameter_id"], "physical_parameters", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_physical_parameter_measures_physical_parameter_id"
  end

  create_table "training_goals", force: true do |t|
    t.string   "denomination", limit: 500
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profile_trainings", force: true do |t|
    t.string   "name",             limit: 200
    t.integer  "training_goal_id"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["created_by"], :name => "fk__profile_trainings_created_by"
    t.index ["training_goal_id"], :name => "fk__profile_trainings_training_goal_id"
    t.foreign_key ["created_by"], "people", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_profile_trainings_created_by"
    t.foreign_key ["training_goal_id"], "training_goals", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_profile_trainings_training_goal_id"
  end

  create_table "registration_codes", force: true do |t|
    t.string   "code",          limit: 100
    t.integer  "individual_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["individual_id"], :name => "fk__registration_codes_individual_id"
    t.foreign_key ["individual_id"], "people", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_registration_codes_individual_id"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
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
    t.index ["email"], :name => "index_users_on_email", :unique => true
    t.index ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer "role_id"
    t.integer "user_id"
    t.index ["role_id"], :name => "fk__roles_users_role_id"
    t.index ["user_id"], :name => "fk__roles_users_user_id"
    t.foreign_key ["role_id"], "roles", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_roles_users_role_id"
    t.foreign_key ["user_id"], "users", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_roles_users_user_id"
  end

  create_table "self_physical_assessments", force: true do |t|
    t.datetime "assessment_date"
    t.string   "note"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["student_id"], :name => "fk__self_physical_assessments_student_id"
    t.foreign_key ["student_id"], "people", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_self_physical_assessments_student_id"
  end

  create_table "workout_sheets", force: true do |t|
    t.datetime "expiration_date"
    t.boolean  "active",                 default: true, null: false
    t.integer  "model_workout_sheet_id"
    t.integer  "training_goal_id"
    t.integer  "student_id"
    t.integer  "instructor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["instructor_id"], :name => "fk__workout_sheets_instructor_id"
    t.index ["model_workout_sheet_id"], :name => "fk__workout_sheets_model_workout_sheet_id"
    t.index ["student_id"], :name => "fk__workout_sheets_student_id"
    t.index ["training_goal_id"], :name => "fk__workout_sheets_training_goal_id"
    t.foreign_key ["instructor_id"], "people", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_workout_sheets_instructor_id"
    t.foreign_key ["model_workout_sheet_id"], "model_workout_sheets", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_workout_sheets_model_workout_sheet_id"
    t.foreign_key ["student_id"], "people", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_workout_sheets_student_id"
    t.foreign_key ["training_goal_id"], "training_goals", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_workout_sheets_training_goal_id"
  end

  create_table "trainings", force: true do |t|
    t.datetime "last_training_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "model_workout_sheet_id"
    t.string   "training_type",          limit: 1
    t.integer  "workout_sheet_id"
    t.integer  "profile_training_id"
    t.index ["model_workout_sheet_id"], :name => "fk__trainings_model_workout_sheet_id"
    t.index ["profile_training_id"], :name => "fk__trainings_profile_training_id"
    t.index ["workout_sheet_id"], :name => "fk__trainings_workout_sheet_id"
    t.foreign_key ["model_workout_sheet_id"], "model_workout_sheets", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_trainings_model_workout_sheet_id"
    t.foreign_key ["profile_training_id"], "profile_trainings", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_trainings_profile_training_id"
    t.foreign_key ["workout_sheet_id"], "workout_sheets", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_trainings_workout_sheet_id"
  end

  create_table "workouts", force: true do |t|
    t.string   "description",          limit: 500
    t.integer  "equipment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "physical_category_id"
    t.index ["equipment_id"], :name => "fk__workouts_equipment_id"
    t.index ["physical_category_id"], :name => "fk__workouts_physical_category_id"
    t.foreign_key ["equipment_id"], "equipment", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_workouts_equipment_id"
    t.foreign_key ["physical_category_id"], "physical_categories", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_workouts_physical_category_id"
  end

  create_table "training_workouts", force: true do |t|
    t.integer  "series"
    t.integer  "repetitions"
    t.float    "load"
    t.integer  "training_id"
    t.integer  "workout_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "duration"
    t.index ["training_id"], :name => "fk__training_workouts_training_id"
    t.index ["workout_id"], :name => "fk__training_workouts_workout_id"
    t.foreign_key ["training_id"], "trainings", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_training_workouts_training_id"
    t.foreign_key ["workout_id"], "workouts", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_training_workouts_workout_id"
  end

end
