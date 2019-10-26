# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_26_074234) do

  create_table "users", force: :cascade do |t|
    t.string "macaddr"
    t.string "zipcode"
    t.boolean "umbrella1", default: false
    t.boolean "umbrella2", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["macaddr"], name: "index_users_on_macaddr"
    t.index ["zipcode"], name: "index_users_on_zipcode"
  end

  create_table "weathers", force: :cascade do |t|
    t.string "zipcode"
    t.string "main", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["zipcode"], name: "index_weathers_on_zipcode"
  end

end
