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

ActiveRecord::Schema.define(version: 2021_12_09_212044) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.bigint "pet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["pet_id"], name: "index_clients_on_pet_id"
  end

  create_table "pet_histories", force: :cascade do |t|
    t.float "weight"
    t.string "height"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "pet_id", null: false
    t.index ["pet_id"], name: "index_pet_histories_on_pet_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "race"
    t.date "birthdate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pizzas", id: :integer, default: nil, force: :cascade do |t|
    t.integer "stock"
    t.decimal "costo"
    t.string "nombre", limit: 25
    t.check_constraint "(stock)::numeric >= 0.00", name: "pizzas_stock_check"
  end

  create_table "usuario", id: :integer, default: nil, force: :cascade do |t|
    t.string "email", limit: 30
  end

  create_table "ventas", id: false, force: :cascade do |t|
    t.string "cliente", limit: 20
    t.date "fecha"
    t.decimal "monto"
    t.integer "pizza"
  end

  add_foreign_key "clients", "pets"
  add_foreign_key "pet_histories", "pets"
  add_foreign_key "ventas", "pizzas", column: "pizza", name: "ventas_pizza_fkey"
end
