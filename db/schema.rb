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

ActiveRecord::Schema.define(version: 20140908135247) do

  create_table "ballots", force: true do |t|
    t.integer  "selection_process_id"
    t.integer  "category_id"
    t.integer  "candidate_id"
    t.string   "digital_signature"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ballots", ["candidate_id"], name: "index_ballots_on_candidate_id"
  add_index "ballots", ["category_id"], name: "index_ballots_on_category_id"
  add_index "ballots", ["selection_process_id"], name: "index_ballots_on_selection_process_id"

  create_table "candidates", force: true do |t|
    t.string   "name"
    t.string   "bios"
    t.string   "url_image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  add_index "candidates", ["category_id"], name: "index_candidates_on_category_id"

  create_table "candidates_categories", id: false, force: true do |t|
    t.integer "category_id"
    t.integer "candidate_id"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "bench"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "selection_process_id"
  end

  add_index "categories", ["selection_process_id"], name: "index_categories_on_selection_process_id"

  create_table "emitted_votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "emitted_votes", ["category_id"], name: "index_emitted_votes_on_category_id"
  add_index "emitted_votes", ["user_id"], name: "index_emitted_votes_on_user_id"

  create_table "organizers", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "web"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo"
    t.integer  "user_id"
  end

  add_index "organizers", ["user_id"], name: "index_organizers_on_user_id"

  create_table "selection_processes", force: true do |t|
    t.string   "name_process"
    t.string   "place"
    t.integer  "duration"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "process_type_id"
    t.integer  "organizer_id"
  end

  add_index "selection_processes", ["organizer_id"], name: "index_selection_processes_on_organizer_id"
  add_index "selection_processes", ["process_type_id"], name: "index_selection_processes_on_process_type_id"

  create_table "users", force: true do |t|
    t.string   "usuario"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "email"
    t.string   "facebook"
    t.string   "twitter"
    t.integer  "tipo_usuario_id",        default: 2,  null: false #2 Jurado.
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

  create_table "voter_lists", force: true do |t|
    t.integer  "user_id"
    t.integer  "selection_process_id"
    t.integer  "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "voter_lists", ["selection_process_id"], name: "index_voter_lists_on_selection_process_id"
  add_index "voter_lists", ["user_id"], name: "index_voter_lists_on_user_id"

end
