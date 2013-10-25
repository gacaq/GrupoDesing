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

ActiveRecord::Schema.define(:version => 20131017151832) do

  create_table "alarms", :force => true do |t|
    t.string   "alarm_type"
    t.string   "description"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.boolean  "active"
    t.integer  "configuration_set_id"
  end

  create_table "configuration_sets", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "configuration_sets", ["user_id"], :name => "index_configuration_sets_on_user_id"

  create_table "device_categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "devices", :force => true do |t|
    t.string   "name"
    t.integer  "configuration_set_id"
    t.integer  "enterprise_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "device_category_id"
    t.boolean  "active"
  end

  add_index "devices", ["configuration_set_id"], :name => "index_devices_on_configuration_set_id"
  add_index "devices", ["device_category_id"], :name => "index_devices_on_device_category_id"

  create_table "enterprise_categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "enterprises", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "logo_image"
    t.integer  "enterprise_category_id"
    t.string   "address"
    t.string   "telephone"
  end

  add_index "enterprises", ["enterprise_category_id"], :name => "index_enterprises_on_enterprise_category_id"

  create_table "historics", :force => true do |t|
    t.datetime "date"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "permissions", :force => true do |t|
    t.string   "controller"
    t.string   "action"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "recipes", :force => true do |t|
    t.string   "recipe_type"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "configuration_set_id"
  end

  add_index "recipes", ["configuration_set_id"], :name => "index_recipes_on_configuration_set_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "user_informations", :force => true do |t|
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "nombre"
    t.string   "apellido"
    t.integer  "cedula"
    t.string   "email"
    t.integer  "role_id"
    t.integer  "enterprise_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "nombre"
    t.string   "apellido"
    t.integer  "role_id",                                :null => false
    t.integer  "enterprise_id",                          :null => false
    t.string   "cedula"
    t.string   "telephone"
    t.boolean  "principal"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "variable_ranges", :force => true do |t|
    t.float    "value_min"
    t.float    "value_max"
    t.integer  "variable_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "owner_type"
    t.integer  "owner_id"
    t.integer  "recipe_id"
    t.integer  "alarm_id"
  end

  create_table "variables", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.boolean  "variable_type"
  end

  create_table "works", :force => true do |t|
    t.float    "variable_value"
    t.integer  "device_id"
    t.integer  "variable_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end