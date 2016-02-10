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

ActiveRecord::Schema.define(version: 20160209131920) do

  create_table "admins", force: :cascade do |t|
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
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "codes", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "default_innings", limit: 4,   default: 2
    t.boolean  "deleted",                     default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "codes_countries", id: false, force: :cascade do |t|
    t.integer "country_id", limit: 4, null: false
    t.integer "code_id",    limit: 4, null: false
  end

  add_index "codes_countries", ["code_id", "country_id"], name: "index_codes_countries_on_code_id_and_country_id", using: :btree
  add_index "codes_countries", ["country_id", "code_id"], name: "index_codes_countries_on_country_id_and_code_id", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "deleted",                default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "game_squads", force: :cascade do |t|
    t.integer  "game_id",       limit: 4
    t.integer  "player_id",     limit: 4
    t.boolean  "selected",                default: false
    t.boolean  "captain",                 default: false
    t.boolean  "wicket_keeper",           default: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "squad_id",      limit: 4
  end

  add_index "game_squads", ["game_id"], name: "index_game_squads_on_game_id", using: :btree
  add_index "game_squads", ["player_id"], name: "index_game_squads_on_player_id", using: :btree
  add_index "game_squads", ["squad_id"], name: "index_game_squads_on_squad_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.date     "match_date"
    t.string   "name",                limit: 255
    t.integer  "number_of_innings",   limit: 4,     default: 2
    t.integer  "location_id",         limit: 4
    t.integer  "code_id",             limit: 4
    t.integer  "squad_1_id",          limit: 4
    t.integer  "squad_2_id",          limit: 4
    t.integer  "wides",               limit: 4,     default: 0
    t.integer  "no_balls",            limit: 4,     default: 0
    t.integer  "byes",                limit: 4,     default: 0
    t.integer  "leg_byes",            limit: 4,     default: 0
    t.integer  "extras",              limit: 4,     default: 0
    t.text     "notes",               limit: 65535
    t.boolean  "deleted",                           default: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "coin_toss_win",       limit: 4,     default: 0
    t.integer  "coin_toss_decision",  limit: 4,     default: 0
    t.integer  "game_winner",         limit: 4,     default: 0
    t.integer  "game_winner_amount",  limit: 4,     default: 0
    t.integer  "game_winner_margin",  limit: 4,     default: 0
    t.integer  "day_night_game",      limit: 4
    t.integer  "player_of_the_match", limit: 4
    t.integer  "umpire_1",            limit: 4
    t.integer  "umpire_2",            limit: 4
    t.integer  "umpire_tv",           limit: 4
    t.integer  "umpire_referee",      limit: 4
    t.integer  "umpire_reserve",      limit: 4
  end

  add_index "games", ["squad_1_id"], name: "index_games_on_squad_1_id", using: :btree
  add_index "games", ["squad_2_id"], name: "index_games_on_squad_2_id", using: :btree

  create_table "innings", force: :cascade do |t|
    t.integer  "game_id",    limit: 4
    t.integer  "batting",    limit: 4, default: 0
    t.integer  "bowling",    limit: 4, default: 0
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "innings", ["game_id"], name: "index_innings_on_game_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "country_id", limit: 4
    t.boolean  "deleted",                default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "city",       limit: 255
  end

  add_index "locations", ["country_id"], name: "index_locations_on_country_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "country_id",     limit: 4
    t.integer  "batting_style",  limit: 4,   default: 0
    t.string   "bowling_style",  limit: 255
    t.string   "role",           limit: 255
    t.boolean  "deleted",                    default: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "dob",            limit: 255
    t.string   "full_name",      limit: 255
    t.string   "scorecard_name", limit: 255
  end

  add_index "players", ["country_id"], name: "index_players_on_country_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "firstname",    limit: 255
    t.string   "lastname",     limit: 255
    t.string   "screenname",   limit: 255
    t.string   "address",      limit: 255
    t.string   "fb_link",      limit: 255
    t.string   "twitter_link", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "phone_number", limit: 255
  end

  create_table "run_outs", force: :cascade do |t|
    t.integer  "game_id",    limit: 4
    t.integer  "innings",    limit: 4
    t.integer  "player_id",  limit: 4
    t.integer  "run_out_by", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "run_outs", ["game_id"], name: "index_run_outs_on_game_id", using: :btree
  add_index "run_outs", ["player_id"], name: "index_run_outs_on_player_id", using: :btree

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
    t.integer  "code_id",     limit: 4
    t.integer  "country_id",  limit: 4
    t.boolean  "deleted",                 default: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "description", limit: 255
  end

  add_index "squads", ["code_id"], name: "index_squads_on_code_id", using: :btree
  add_index "squads", ["country_id"], name: "index_squads_on_country_id", using: :btree

  create_table "stats", force: :cascade do |t|
    t.integer  "inning_id",      limit: 4
    t.integer  "player_id",      limit: 4
    t.integer  "runs",           limit: 4,  default: 0
    t.integer  "minutes",        limit: 4,  default: 0
    t.integer  "balls",          limit: 4,  default: 0
    t.integer  "fours",          limit: 4,  default: 0
    t.integer  "sixes",          limit: 4,  default: 0
    t.boolean  "run_out",                   default: false
    t.integer  "bowled_by",      limit: 4
    t.integer  "caught_by",      limit: 4
    t.integer  "stumped_by",     limit: 4,  default: 0
    t.integer  "overs",          limit: 4,  default: 0
    t.integer  "maidens",        limit: 4,  default: 0
    t.integer  "runs_against",   limit: 4,  default: 0
    t.integer  "wickets",        limit: 4,  default: 0
    t.integer  "wides",          limit: 4,  default: 0
    t.integer  "no_balls",       limit: 4,  default: 0
    t.integer  "zeroes_against", limit: 4,  default: 0
    t.integer  "fours_against",  limit: 4,  default: 0
    t.integer  "sixes_against",  limit: 4,  default: 0
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "batting_order",  limit: 4
    t.integer  "bowling_order",  limit: 4
    t.integer  "fow_order",      limit: 4
    t.integer  "fow_score",      limit: 4
    t.float    "fow_overs",      limit: 24
    t.integer  "fow_balls",      limit: 4
    t.integer  "lbw_by",         limit: 4
    t.integer  "over_partial",   limit: 4
  end

  add_index "stats", ["inning_id"], name: "index_stats_on_inning_id", using: :btree
  add_index "stats", ["player_id"], name: "index_stats_on_player_id", using: :btree

  create_table "team_players", force: :cascade do |t|
    t.integer  "team_id",       limit: 4
    t.integer  "player_id",     limit: 4
    t.boolean  "captain",                 default: false
    t.boolean  "wicket_keeper",           default: false
    t.boolean  "deleted",                 default: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "team_players", ["team_id"], name: "index_team_players_on_team_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.integer  "game_id",    limit: 4
    t.string   "name",       limit: 255
    t.integer  "squad_id",   limit: 4
    t.boolean  "deleted",                default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "teams", ["game_id"], name: "index_teams_on_game_id", using: :btree

  create_table "umpires", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "deleted",                default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "country_id", limit: 4
  end

  add_index "umpires", ["country_id"], name: "index_umpires_on_country_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",     null: false
    t.string   "encrypted_password",     limit: 255, default: "",     null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "role",                   limit: 255, default: "user"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "game_squads", "games"
  add_foreign_key "game_squads", "players"
  add_foreign_key "game_squads", "squads"
  add_foreign_key "innings", "games"
  add_foreign_key "locations", "countries"
  add_foreign_key "players", "countries"
  add_foreign_key "run_outs", "games"
  add_foreign_key "run_outs", "players"
  add_foreign_key "squad_players", "players"
  add_foreign_key "squad_players", "squads"
  add_foreign_key "squads", "codes"
  add_foreign_key "squads", "countries"
  add_foreign_key "stats", "innings"
  add_foreign_key "stats", "players"
  add_foreign_key "team_players", "teams"
  add_foreign_key "teams", "games"
  add_foreign_key "umpires", "countries"
end
