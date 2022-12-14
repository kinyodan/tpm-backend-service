# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_08_12_024156) do
  create_table "books", force: :cascade do |t|
    t.string "url"
    t.string "name"
    t.string "isbn"
    t.text "authors"
    t.string "numberOfPages"
    t.string "publisher"
    t.string "country"
    t.string "mediaType"
    t.datetime "released"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.integer "book_id"
    t.string "url"
    t.string "name"
    t.string "gender"
    t.string "culture"
    t.string "born"
    t.string "died"
    t.text "titles"
    t.text "aliases"
    t.string "father"
    t.string "mother"
    t.string "spouse"
    t.text "allegiances"
    t.text "books"
    t.text "povBooks"
    t.string "tvSeries"
    t.string "playedby"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "book_isbn"
    t.string "played_by"
    t.integer "age"
    t.text "pov_books"
    t.text "tv_series"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "book_id"
    t.string "title"
    t.string "comment"
    t.integer "character_id"
    t.string "commenter_ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "book_isbn"
  end

end
