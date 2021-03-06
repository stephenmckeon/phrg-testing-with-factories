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

ActiveRecord::Schema.define(version: 5) do

  create_table "bears", force: :cascade do |t|
    t.integer "weight"
    t.integer "zoo_id"
    t.string "color"
  end

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.decimal "lat"
    t.decimal "long"
  end

  create_table "storks", force: :cascade do |t|
    t.integer "zoo_id"
    t.integer "bill_length"
    t.integer "wing_span"
    t.string "color"
  end

  create_table "tigers", force: :cascade do |t|
    t.integer "zoo_id"
    t.integer "number_of_stripes"
    t.integer "weight"
  end

  create_table "zoos", force: :cascade do |t|
    t.integer "location_id"
    t.integer "square_footage"
    t.integer "tonnage_of_straw"
    t.integer "tonnage_of_birdfeed"
  end

end
