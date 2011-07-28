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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110725235336) do

  create_table "guest_passes", :force => true do |t|
    t.string   "token"
    t.integer  "proposal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proposals", :force => true do |t|
    t.text     "wording"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subject"
    t.string   "protocol_class"
  end

  create_table "votes", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "proposal_id"
    t.string   "value"
  end

end
