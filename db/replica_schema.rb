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

ActiveRecord::Schema[7.0].define(version: 2022_08_04_050115) do
  create_table "books", force: :cascade do |t|
    t.string "url"
    t.string "name"
    t.string "isbn"
    t.string "authors"
    t.string "numberOfPages"
    t.string "publisher"
    t.string "country"
    t.string "mediaType"
    t.string "releases"
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
    t.string "titles"
    t.string "aliases"
    t.string "father"
    t.string "mother"
    t.string "spouse"
    t.string "allegiances"
    t.string "books"
    t.string "povBooks"
    t.string "tvSeries"
    t.string "playedby"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
