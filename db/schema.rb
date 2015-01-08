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

ActiveRecord::Schema.define(version: 20150108013819) do

  create_table "b_user_sim_data", force: true do |t|
    t.integer  "user_id"
    t.integer  "simulation_id"
    t.integer  "simulation_datum_id"
    t.integer  "no_of_slots"
    t.integer  "budget_available"
    t.float    "cprp"
    t.float    "grp"
    t.integer  "play_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "simulateresults", force: true do |t|
    t.string   "result"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "simulationId"
    t.integer  "simulation_id"
    t.integer  "userId"
  end

  create_table "simulation_data", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "simulation_id"
    t.string   "channel"
    t.string   "reg_market"
    t.date     "performance_date"
    t.string   "performance_day"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "programme_name"
    t.integer  "duration"
    t.float    "tvr"
    t.integer  "cost_per_slot"
  end

  create_table "simulation_user_data", force: true do |t|
    t.integer  "simulation_id"
    t.integer  "user_id"
    t.integer  "budget"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "budget_available"
    t.float    "total_grp"
    t.float    "total_cprp"
    t.integer  "score"
    t.integer  "points"
  end

  create_table "simulations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "excel_file_file_name"
    t.string   "excel_file_content_type"
    t.integer  "excel_file_file_size"
    t.datetime "excel_file_updated_at"
    t.integer  "sim_spot"
    t.integer  "sim_grp"
    t.integer  "sim_cprp"
    t.integer  "game"
    t.integer  "game_id"
  end

  create_table "user_sim_data", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "simulation_id"
    t.integer  "simulation_datum_id"
    t.integer  "no_of_slots"
    t.integer  "budget_available"
    t.float    "cprp"
    t.float    "grp"
    t.integer  "play_count"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
