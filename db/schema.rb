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

ActiveRecord::Schema.define(version: 2020_01_21_105942) do

  create_table "growlists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "plant_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "start_time"
  end

  create_table "plant_growths", force: :cascade do |t|
    t.string "name"
    t.integer "germinate_s"
    t.integer "germinate_f"
    t.integer "sprouting_s"
    t.integer "sprouting_f"
    t.integer "harvest_s"
    t.integer "harvest_f"
    t.integer "maturity_s"
    t.integer "maturity_f"
    t.integer "pot_s"
    t.integer "pot_f"
    t.integer "protect_s"
    t.integer "protect_f"
    t.integer "flowering_s"
    t.integer "flowering_f"
    t.integer "fruiting_s"
    t.integer "fruiting_f"
    t.integer "fertilize_s"
    t.integer "fertilize_f"
    t.integer "bloom_s"
    t.integer "bloom_f"
    t.integer "outside_s"
    t.integer "outside_f"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.string "bot_name"
    t.string "alt_name"
    t.string "img_url"
    t.string "description"
    t.string "uses"
    t.string "health"
    t.string "climate"
    t.string "soil"
    t.string "propagation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wishlists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "plant_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
