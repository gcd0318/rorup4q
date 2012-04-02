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

ActiveRecord::Schema.define(:version => 20120313082914) do

  create_table "attachments", :force => true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.binary   "data"
    t.string   "filepath"
    t.integer  "bug_id"
    t.integer  "testcase_id"
  end

  create_table "bug_build_xrefs", :id => false, :force => true do |t|
    t.integer  "bug_id"
    t.integer  "build_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bug_histories", :force => true do |t|
    t.integer  "bug_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "update_by_id"
    t.string   "comments"
  end

  create_table "bug_xrefs", :id => false, :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "from_bug_id"
    t.integer  "to_bug_id"
  end

  create_table "bugs", :force => true do |t|
    t.string   "title"
    t.string   "body"
    t.integer  "reporter_id"
    t.string   "status",        :default => "OPEN"
    t.integer  "feature_id"
    t.string   "bug_type"
    t.integer  "build_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "severity",      :default => "MID"
    t.integer  "assign_to_id"
    t.integer  "this_build_id"
  end

  create_table "builds", :force => true do |t|
    t.string   "name"
    t.time     "build_date", :default => '2000-01-01 16:13:45'
    t.integer  "track_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components", :force => true do |t|
    t.integer  "track_id"
    t.string   "name"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "features", :force => true do |t|
    t.string   "name"
    t.integer  "component_id"
    t.string   "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fixing_codes", :force => true do |t|
    t.string   "filepath"
    t.integer  "bug_id"
    t.integer  "owner_id"
    t.integer  "approved"
    t.integer  "approver_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pushed_files"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repositories", :force => true do |t|
    t.string   "name"
    t.integer  "track_id"
    t.string   "password"
    t.string   "lr_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "filepath"
    t.string   "mgr_type"
  end

  create_table "testcase_bug_xrefs", :id => false, :force => true do |t|
    t.integer  "testcase_id"
    t.integer  "bug_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "testcase_xrefs", :id => false, :force => true do |t|
    t.integer  "from_testcase_id"
    t.integer  "to_testcase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "from_id"
    t.integer  "to_id"
  end

  create_table "testcases", :force => true do |t|
    t.integer  "feature_id"
    t.string   "title"
    t.string   "body"
    t.string   "status",       :default => "UNDO"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "assign_to_id"
    t.integer  "build_id"
  end

  create_table "tracks", :force => true do |t|
    t.integer  "product_id"
    t.integer  "owner_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "main_repo_id"
  end

  create_table "user_bug_xrefs", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "bug_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_component_xrefs", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "component_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_feature_xrefs", :id => false, :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "feature_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_product_xrefs", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_testcase_xrefs", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "testcase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_track_xrefs", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "track_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "hashed_password"
    t.string   "seed"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
