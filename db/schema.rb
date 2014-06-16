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

ActiveRecord::Schema.define(version: 20140616130128) do

  create_table "candidates", force: true do |t|
    t.string   "name"
    t.string   "bios"
    t.string   "url_image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  add_index "candidates", ["category_id"], name: "index_candidates_on_category_id"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "bench"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "selection_process_id"
  end

  add_index "categories", ["selection_process_id"], name: "index_categories_on_selection_process_id"

  create_table "categories_candidates", id: false, force: true do |t|
    t.integer "categories_id"
    t.integer "candidates_id"
  end

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
    t.string   "clave"
    t.string   "facebook"
    t.string   "twitter"
    t.integer  "tipo_usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
