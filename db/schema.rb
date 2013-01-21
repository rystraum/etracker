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

ActiveRecord::Schema.define(:version => 20130121174009) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "audit_logs", :force => true do |t|
    t.integer  "unit_id"
    t.string   "state"
    t.text     "comments"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "auditor_id"
  end

  add_index "audit_logs", ["unit_id"], :name => "index_audit_logs_on_unit_id"

  create_table "file_assets", :force => true do |t|
    t.integer  "picture_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "picture_type"
  end

  add_index "file_assets", ["picture_id"], :name => "index_file_assets_on_unit_id"

  create_table "items", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "quantity_unit"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "logs", :force => true do |t|
    t.integer  "unit_id"
    t.integer  "status"
    t.string   "remarks"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "logs", ["unit_id"], :name => "index_logs_on_unit_id"
  add_index "logs", ["user_id"], :name => "index_logs_on_user_id"

  create_table "maintenance_repair_logs", :force => true do |t|
    t.string   "supplier"
    t.string   "type"
    t.integer  "personnel_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "unit_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "pullout_logs", :force => true do |t|
    t.integer  "unit_id"
    t.integer  "requesting_user_id"
    t.integer  "authorizing_user_id"
    t.text     "purpose"
    t.date     "pullout_date"
    t.date     "return_date"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "pullout_logs", ["unit_id"], :name => "index_pullout_logs_on_unit_id"

  create_table "transfer_records", :force => true do |t|
    t.string   "name"
    t.date     "transfer_date"
    t.integer  "unit_id"
    t.integer  "location_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "units", :force => true do |t|
    t.date     "aquisition_date"
    t.float    "aquisition_cost"
    t.string   "brand"
    t.string   "serial_no"
    t.string   "model"
    t.string   "name"
    t.string   "condition"
    t.boolean  "is_active",            :default => true
    t.integer  "user_id"
    t.integer  "location_id"
    t.integer  "item_id"
    t.string   "barcode_file_name"
    t.string   "barcode_content_type"
    t.integer  "barcode_file_size"
    t.datetime "barcode_updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "asset_tag_no"
    t.string   "make"
    t.string   "color"
    t.string   "state"
  end

  add_index "units", ["location_id"], :name => "index_units_on_location_id"
  add_index "units", ["user_id"], :name => "index_units_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.boolean  "admin",                  :default => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "name"
    t.string   "contact_number"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
