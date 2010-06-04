# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100604212230) do

  create_table "avatars", :force => true do |t|
    t.integer "user_id"
    t.string  "url"
  end

  create_table "billable_weeks", :force => true do |t|
    t.integer  "timesheet_id"
    t.integer  "client_id"
    t.datetime "start_date"
    t.integer  "billing_code_id"
    t.integer  "monday_hours"
    t.integer  "tuesday_hours"
    t.integer  "wednesday_hours"
    t.integer  "thursday_hours"
    t.integer  "friday_hours"
    t.integer  "saturday_hours"
    t.integer  "sunday_hours"
  end

  create_table "billing_codes", :force => true do |t|
    t.integer "client_id"
    t.string  "code"
    t.text    "description"
  end

  create_table "businesses", :force => true do |t|
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "total_spend"
    t.integer  "hottest_spend_day"
  end

  create_table "comments", :force => true do |t|
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at"
  end

  create_table "contact_cards", :force => true do |t|
    t.integer "client_id"
    t.integer "contact_id"
    t.string  "contact_type"
  end

  create_table "expense_reports", :force => true do |t|
    t.integer "user_id"
  end

  create_table "people", :force => true do |t|
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", :force => true do |t|
    t.string   "role"
    t.integer  "team_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "related_billing_codes", :id => false, :force => true do |t|
    t.integer "first_billing_code_id",  :null => false
    t.integer "second_billing_code_id", :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id"
    t.text     "data"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "coach"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timesheets", :force => true do |t|
    t.boolean  "submitted",    :default => false
    t.integer  "user_id"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.integer  "approver_id"
    t.integer  "lock_version", :default => 0
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.boolean  "authorized_approver"
    t.integer  "client_id"
    t.datetime "timesheets_updated_at"
  end

end
