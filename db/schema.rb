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

ActiveRecord::Schema.define(version: 20140422214855) do

  create_table "organizers", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "web"
    t.string   "email"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "selection_process", force: true do |t|
    t.string   "name_process"
    t.string   "place"
    t.integer  "duration"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "state"
    t.integer  "process_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "selection_process", ["process_type_id"], name: "index_selection_process_on_process_type_id"

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
