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

ActiveRecord::Schema.define(version: 20151203091949) do

  create_table "codes", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "deleted",                default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "deleted",                default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "games", force: :cascade do |t|
    t.datetime "match_date"
    t.integer  "location_id", limit: 4
    t.integer  "squad_1_id",  limit: 4
    t.integer  "squad_2_id",  limit: 4
    t.boolean  "deleted"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "games", ["squad_1_id"], name: "index_games_on_squad_1_id", using: :btree
  add_index "games", ["squad_2_id"], name: "index_games_on_squad_2_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "country_id", limit: 4
    t.boolean  "deleted",                default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "locations", ["country_id"], name: "index_locations_on_country_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "country_id",    limit: 4
    t.integer  "batting_style", limit: 4
    t.string   "bowling_style", limit: 255
    t.integer  "role",          limit: 4
    t.boolean  "deleted",                   default: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "players", ["country_id"], name: "index_players_on_country_id", using: :btree

  create_table "squad_players", force: :cascade do |t|
    t.integer  "player_id",  limit: 4
    t.integer  "squad_id",   limit: 4
    t.boolean  "captain",              default: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "squad_players", ["player_id"], name: "index_squad_players_on_player_id", using: :btree
  add_index "squad_players", ["squad_id"], name: "index_squad_players_on_squad_id", using: :btree

  create_table "squads", force: :cascade do |t|
    t.integer  "code_id",    limit: 4
    t.integer  "country_id", limit: 4
    t.boolean  "deleted",              default: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "squads", ["code_id"], name: "index_squads_on_code_id", using: :btree
  add_index "squads", ["country_id"], name: "index_squads_on_country_id", using: :btree

end
