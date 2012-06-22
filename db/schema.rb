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

ActiveRecord::Schema.define(:version => 20120622165343) do

  create_table "books", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.text     "points_of_sale"
    t.text     "buy_online"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.string   "section"
    t.text     "specification"
  end

  create_table "categories", :force => true do |t|
    t.string "name"
    t.string "locale"
  end

  create_table "courses", :force => true do |t|
    t.integer  "category_id"
    t.string   "title"
    t.text     "body"
    t.text     "specification"
    t.text     "objective"
    t.text     "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "footer_links", :force => true do |t|
    t.string   "location"
    t.string   "title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pdfs", :force => true do |t|
    t.string   "title"
    t.integer  "pdfable_id"
    t.string   "pdfable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "photos", :force => true do |t|
    t.string   "title"
    t.integer  "photoable_id"
    t.string   "photoable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "posts", :force => true do |t|
    t.datetime "published_at"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "audio"
    t.string   "video"
    t.string   "sidebar_title"
    t.text     "sidebar_body"
    t.string   "section"
    t.boolean  "draft"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
