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

ActiveRecord::Schema.define(version: 20150207171321) do

  create_table "courses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "subject",    limit: 255
    t.string   "teacher",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.boolean  "public",     limit: 1
  end

  create_table "courses_users", id: false, force: :cascade do |t|
    t.integer "user_id",   limit: 4
    t.integer "course_id", limit: 4
  end

  add_index "courses_users", ["course_id"], name: "index_courses_users_on_course_id", using: :btree
  add_index "courses_users", ["user_id"], name: "index_courses_users_on_user_id", using: :btree

  create_table "homes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homeworks", force: :cascade do |t|
    t.integer  "lesson_id",  limit: 4
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.string   "student",    limit: 255
    t.datetime "time"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "homeworks", ["lesson_id"], name: "index_homeworks_on_lesson_id", using: :btree

  create_table "lessons", force: :cascade do |t|
    t.integer  "course_id",  limit: 4
    t.string   "title",      limit: 255
    t.datetime "time"
    t.string   "teacher",    limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.boolean  "public",     limit: 1
  end

  add_index "lessons", ["course_id"], name: "index_lessons_on_course_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "title",       limit: 255
    t.text     "content",     limit: 65535
    t.string   "author_name", limit: 255
    t.datetime "time"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255
    t.string   "clazz",                  limit: 255
    t.integer  "role",                   limit: 4
    t.string   "avatar",                 limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
