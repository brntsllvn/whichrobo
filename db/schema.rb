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

ActiveRecord::Schema.define(version: 20151124204953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_stores", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  add_index "book_stores", ["deleted_at"], name: "index_book_stores_on_deleted_at", using: :btree

  create_table "books", force: :cascade do |t|
    t.string   "isbn10"
    t.string   "title"
    t.string   "author"
    t.decimal  "new_price"
    t.integer  "new_in_stock"
    t.decimal  "used_price"
    t.integer  "used_in_stock"
    t.decimal  "rent_price"
    t.integer  "rent_in_stock"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "isbn13"
    t.integer  "book_store_id"
    t.datetime "deleted_at"
  end

  add_index "books", ["book_store_id"], name: "index_books_on_book_store_id", using: :btree
  add_index "books", ["deleted_at"], name: "index_books_on_deleted_at", using: :btree

end
