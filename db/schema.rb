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

ActiveRecord::Schema[7.2].define(version: 2024_12_02_114954) do
  create_table "donations", force: :cascade do |t|
    t.integer "receiver_id"
    t.integer "amount_in_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "aasm_state"
    t.datetime "confirmed_at"
    t.datetime "failed_at"
    t.datetime "revoked_at"
    t.index ["receiver_id"], name: "index_donations_on_receiver_id"
  end

  create_table "receivers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "donations", "receivers"
end
