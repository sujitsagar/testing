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

ActiveRecord::Schema.define(:version => 20110507132702) do

  create_table "attendances", :force => true do |t|
    t.integer  "deal_id"
    t.integer  "user_id"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendances", ["deal_id"], :name => "index_attendances_on_deal_id"
  add_index "attendances", ["user_id"], :name => "index_attendances_on_user_id"

  create_table "cities", :force => true do |t|
    t.string   "cityname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deallikes", :force => true do |t|
    t.integer  "deal_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deals", :force => true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.string   "image"
    t.string   "orignalprice"
    t.string   "discount"
    t.integer  "maxattenders"
    t.text     "info1"
    t.text     "terms"
    t.text     "aboutdeal"
    t.text     "info2"
    t.text     "address"
    t.datetime "startat"
    t.datetime "endat"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
  end

  add_index "deals", ["city_id"], :name => "index_deals_on_city_id"

  create_table "maingroups", :force => true do |t|
    t.string   "maingroup"
    t.string   "maingroupimage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchantcomments", :force => true do |t|
    t.integer  "merchant_id"
    t.integer  "user_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "merchantcomments", ["merchant_id"], :name => "index_merchantcomments_on_merchant_id"
  add_index "merchantcomments", ["user_id"], :name => "index_merchantcomments_on_user_id"

  create_table "merchantlikes", :force => true do |t|
    t.integer  "merchant_id"
    t.integer  "user_id"
    t.integer  "rating1"
    t.integer  "rating2"
    t.integer  "rating3"
    t.integer  "rating4"
    t.integer  "rating5"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "merchantlikes", ["merchant_id"], :name => "index_merchantlikes_on_merchant_id"
  add_index "merchantlikes", ["user_id"], :name => "index_merchantlikes_on_user_id"

  create_table "merchants", :force => true do |t|
    t.string   "merchantname"
    t.string   "merchantimage"
    t.string   "menulink"
    t.text     "tribecomment"
    t.text     "merachantinfo"
    t.string   "merspectext"
    t.string   "merspecimage"
    t.string   "meroffertext"
    t.string   "merofferimage"
    t.text     "meraddress"
    t.text     "merchantphone"
    t.string   "merextra1"
    t.string   "merextra2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id"], :name => "index_microposts_on_user_id"

  create_table "productcomments", :force => true do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.string   "content"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "productcomments", ["product_id"], :name => "index_productcomments_on_product_id"
  add_index "productcomments", ["user_id"], :name => "index_productcomments_on_user_id"

  create_table "productlikes", :force => true do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.integer  "rating1"
    t.integer  "rating2"
    t.integer  "rating3"
    t.integer  "rating4"
    t.integer  "rating5"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "productlikes", ["product_id"], :name => "index_productlikes_on_product_id"
  add_index "productlikes", ["user_id"], :name => "index_productlikes_on_user_id"

  create_table "products", :force => true do |t|
    t.string   "productname"
    t.string   "productimage"
    t.integer  "subgroup_id"
    t.integer  "user_id"
    t.text     "details"
    t.string   "flipprice"
    t.string   "fliplink"
    t.string   "amazonprice"
    t.string   "amazonlink"
    t.string   "ebayprice"
    t.string   "ebaylink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["user_id"], :name => "index_products_on_user_id"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "subgroups", :force => true do |t|
    t.string   "subgroup"
    t.integer  "maingroup_id"
    t.string   "cate1"
    t.string   "cate1image"
    t.string   "cate2"
    t.string   "cate2image"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subgroups", ["maingroup_id"], :name => "index_subgroups_on_maingroup_id"

  create_table "uploadfiles", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin"
    t.string   "lastname"
    t.integer  "city_id"
    t.string   "sex"
    t.date     "birthday_date"
    t.string   "profession"
    t.string   "company"
    t.string   "confirmation"
    t.boolean  "active"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
