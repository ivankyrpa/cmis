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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130115105026) do

  create_table "addresses", :force => true do |t|
    t.string   "country_id"
    t.string   "region_id"
    t.string   "city_id"
    t.string   "settlement_id"
    t.string   "district_id"
    t.string   "street_id"
    t.string   "house"
    t.string   "flat"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "pacient_id"
  end

  create_table "age_groups", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "to"
    t.integer  "from"
  end

  create_table "analysis_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "analysis_types", ["name"], :name => "index_analysis_types_on_name", :unique => true

  create_table "answers", :force => true do |t|
    t.integer  "interview_id"
    t.integer  "question_id"
    t.integer  "rating"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "assignments", :force => true do |t|
    t.integer  "record_id"
    t.integer  "history_id"
    t.integer  "medicament_id"
    t.decimal  "amount"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "blood_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "blood_groups", ["name"], :name => "index_blood_groups_on_name", :unique => true

  create_table "characteristics", :force => true do |t|
    t.integer  "group_id"
    t.string   "name"
    t.float    "first_value"
    t.float    "second_value"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "characteristics_surveys", :force => true do |t|
    t.integer  "survey_id"
    t.integer  "characteristic_id"
    t.float    "value"
    t.integer  "result"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "f_characteristic_id"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cities", ["name"], :name => "index_cities_on_name", :unique => true

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "countries", ["name"], :name => "index_countries_on_name", :unique => true

  create_table "diagnoses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "code"
    t.integer  "user_type_id"
  end

  add_index "diagnoses", ["name"], :name => "index_diagnoses_on_name", :unique => true

  create_table "districts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "districts", ["name"], :name => "index_districts_on_name", :unique => true

  create_table "f_characteristics", :force => true do |t|
    t.integer  "group_id"
    t.string   "name"
    t.float    "norm_c"
    t.float    "norm_sc"
    t.float    "norm_dc"
    t.float    "dev_c"
    t.float    "dev_sc"
    t.float    "dev_dc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "f_recommendations", :force => true do |t|
    t.integer  "group_id"
    t.string   "content"
    t.integer  "low_c"
    t.integer  "high_c"
    t.integer  "low_dc"
    t.integer  "high_dc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.integer  "user_type_id"
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "histories", :force => true do |t|
    t.integer  "pacient_id"
    t.integer  "diagnosis_id"
    t.integer  "treatment_type_id"
    t.integer  "user_id"
    t.string   "number"
    t.date     "date_supply"
    t.text     "description"
    t.date     "date_extract"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "insurance_companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "insurance_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "interviews", :force => true do |t|
    t.integer  "pacient_id"
    t.date     "interview_date"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "l_recommendations", :force => true do |t|
    t.integer  "group_id"
    t.text     "content_o"
    t.text     "content_c"
    t.text     "content_d"
    t.integer  "low"
    t.integer  "high"
    t.integer  "min"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "medicaments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "medicaments", ["name"], :name => "index_medicaments_on_name", :unique => true

  create_table "operations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "operations", ["name"], :name => "index_operations_on_name", :unique => true

  create_table "pacients", :force => true do |t|
    t.string   "lastname"
    t.string   "middlename"
    t.string   "firstname"
    t.date     "birthdate"
    t.boolean  "sex"
    t.string   "phone"
    t.integer  "age_group_id"
    t.integer  "blood_group_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "passport_seria"
    t.integer  "passport_number"
  end

  add_index "pacients", ["passport_number", "passport_seria"], :name => "index_pacients_on_passport_number_and_passport_seria", :unique => true

  create_table "policies", :force => true do |t|
    t.string   "number"
    t.integer  "insurance_company_id"
    t.integer  "insurance_type_id"
    t.integer  "pacient_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "questions", :force => true do |t|
    t.integer  "section_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "records", :force => true do |t|
    t.integer  "pacient_id"
    t.integer  "assignment_id"
    t.integer  "diagnosis_id"
    t.date     "date_accessed"
    t.text     "complaints"
    t.text     "recommendation"
    t.string   "doctor_name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "regions", ["name"], :name => "index_regions_on_name", :unique => true

  create_table "sections", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "settlements", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "settlements", ["name"], :name => "index_settlements_on_name", :unique => true

  create_table "streets", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "streets", ["name"], :name => "index_streets_on_name", :unique => true

  create_table "surveys", :force => true do |t|
    t.integer  "pacient_id"
    t.date     "survey_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "symptoms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "symptoms", ["name"], :name => "index_symptoms_on_name", :unique => true

  create_table "treatment_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "treatment_types", ["name"], :name => "index_treatment_types_on_name", :unique => true

  create_table "user_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "admin",      :default => false
  end

  add_index "user_types", ["name"], :name => "index_user_types_on_name", :unique => true

  create_table "users", :force => true do |t|
    t.string   "fio"
    t.string   "login"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "user_type_id"
    t.string   "encrypted_password"
    t.string   "salt"
  end

end
