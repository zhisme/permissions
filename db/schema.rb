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

ActiveRecord::Schema.define(version: 20171124105941) do

  create_table "permissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "action"
    t.boolean  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action", "value"], name: "index_permissions_on_action_and_value", unique: true, using: :btree
    t.index ["action"], name: "index_permissions_on_action", using: :btree
  end

  create_table "permissions_roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "role_id"
    t.integer "permission_id"
    t.index ["permission_id"], name: "index_permissions_roles_on_permission_id", using: :btree
    t.index ["role_id"], name: "index_permissions_roles_on_role_id", using: :btree
  end

  create_table "permissions_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "permission_id"
    t.index ["permission_id"], name: "index_permissions_users_on_permission_id", using: :btree
    t.index ["user_id"], name: "index_permissions_users_on_user_id", using: :btree
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  create_table "users_roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id", using: :btree
    t.index ["user_id"], name: "index_users_roles_on_user_id", using: :btree
  end

end
