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

ActiveRecord::Schema.define(version: 20150316113423) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channels", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.string   "title"
    t.text     "note"
    t.date     "occured_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "conversation_id"
    t.integer  "channel_id"
    t.integer  "participant_id"
    t.text     "content"
    t.date     "sent_on"
    t.time     "sent_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "messages", ["channel_id"], name: "index_messages_on_channel_id", using: :btree
  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["participant_id"], name: "index_messages_on_participant_id", using: :btree

  create_table "participants", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "messages", "channels"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "participants"
end
