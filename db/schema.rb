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

ActiveRecord::Schema.define(:version => 20121219121830) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",                                  :null => false
    t.string   "resource_type",                                :null => false
    t.integer  "author_id",     :precision => 38, :scale => 0
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "i_act_adm_com_aut_typ_aut_id"
  add_index "active_admin_comments", ["namespace"], :name => "i_act_adm_com_nam"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "i_adm_not_res_typ_res_id"

  create_table "customer_leads", :force => true do |t|
    t.text     "info"
    t.integer  "product_id",        :precision => 38, :scale => 0
    t.integer  "parent_product_id", :precision => 38, :scale => 0
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  create_table "feedbacks", :force => true do |t|
    t.integer  "rating",     :precision => 38, :scale => 0
    t.integer  "product_id", :precision => 38, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_url"
    t.integer  "store_id",    :precision => 38, :scale => 0
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "related_products", :force => true do |t|
    t.integer  "product_id",     :precision => 38, :scale => 0
    t.integer  "rel_product_id", :precision => 38, :scale => 0
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  create_table "stores", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "logo_url"
    t.string   "location_name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                                 :default => "", :null => false
    t.string   "encrypted_password",                                    :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :precision => 38, :scale => 0, :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                            :null => false
    t.datetime "updated_at",                                                            :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "i_users_reset_password_token", :unique => true

end
