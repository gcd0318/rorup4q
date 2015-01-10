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

ActiveRecord::Schema.define(version: 20120313082914) do

  create_table "attachments", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "owner_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.binary   "data",        limit: 65535
    t.string   "filepath",    limit: 255
    t.integer  "bug_id",      limit: 4
    t.integer  "testcase_id", limit: 4
  end

  create_table "bug_build_xrefs", id: false, force: :cascade do |t|
    t.integer  "bug_id",     limit: 4
    t.integer  "build_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bug_histories", force: :cascade do |t|
    t.integer  "bug_id",       limit: 4
    t.string   "status",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "update_by_id", limit: 4
    t.string   "comments",     limit: 255
  end

  create_table "bug_xrefs", id: false, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "from_bug_id", limit: 4
    t.integer  "to_bug_id",   limit: 4
  end

  create_table "bugs", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.string   "body",          limit: 255
    t.integer  "reporter_id",   limit: 4
    t.string   "status",        limit: 255, default: "OPEN"
    t.integer  "feature_id",    limit: 4
    t.string   "bug_type",      limit: 255
    t.integer  "build_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "severity",      limit: 255, default: "MID"
    t.integer  "assign_to_id",  limit: 4
    t.integer  "this_build_id", limit: 4
  end

  create_table "builds", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.time     "build_date",             default: '2000-01-01 13:42:57'
    t.integer  "track_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components", force: :cascade do |t|
    t.integer  "track_id",   limit: 4
    t.string   "name",       limit: 255
    t.integer  "owner_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "features", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "component_id", limit: 4
    t.string   "owner_id",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fixing_codes", force: :cascade do |t|
    t.string   "filepath",     limit: 255
    t.integer  "bug_id",       limit: 4
    t.integer  "owner_id",     limit: 4
    t.integer  "approved",     limit: 4
    t.integer  "approver_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pushed_files", limit: 255
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "owner_id",   limit: 4
    t.string   "desc",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repositories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "track_id",   limit: 4
    t.string   "password",   limit: 255
    t.string   "lr_flag",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "filepath",   limit: 255
    t.string   "mgr_type",   limit: 255
  end

  create_table "testcase_bug_xrefs", id: false, force: :cascade do |t|
    t.integer  "testcase_id", limit: 4
    t.integer  "bug_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "testcase_xrefs", id: false, force: :cascade do |t|
    t.integer  "from_testcase_id", limit: 4
    t.integer  "to_testcase_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "from_id",          limit: 4
    t.integer  "to_id",            limit: 4
  end

  create_table "testcases", force: :cascade do |t|
    t.integer  "feature_id",   limit: 4
    t.string   "title",        limit: 255
    t.string   "body",         limit: 255
    t.string   "status",       limit: 255, default: "UNDO"
    t.integer  "owner_id",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "assign_to_id", limit: 4
    t.integer  "build_id",     limit: 4
  end

  create_table "tracks", force: :cascade do |t|
    t.integer  "product_id",   limit: 4
    t.integer  "owner_id",     limit: 4
    t.string   "name",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "main_repo_id", limit: 4
  end

  create_table "user_bug_xrefs", id: false, force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "bug_id",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_component_xrefs", id: false, force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "component_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_feature_xrefs", id: false, force: :cascade do |t|
    t.integer  "user_id",    limit: 4, null: false
    t.integer  "feature_id", limit: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_product_xrefs", id: false, force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "product_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_testcase_xrefs", id: false, force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "testcase_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_track_xrefs", id: false, force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "track_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 255
    t.string   "hashed_password", limit: 255
    t.string   "seed",            limit: 255
    t.string   "email",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
