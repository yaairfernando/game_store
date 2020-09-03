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

ActiveRecord::Schema.define(version: 2020_08_22_021042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sale_concepts", force: :cascade do |t|
    t.bigint "sale_id", null: false
    t.bigint "unit_price"
    t.bigint "total"
    t.integer "amount"
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_sale_concepts_on_game_id"
    t.index ["sale_id"], name: "index_sale_concepts_on_sale_id"
  end

  create_table "sale_details", force: :cascade do |t|
    t.string "currency"
    t.string "country"
    t.string "state"
    t.bigint "sale_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sale_id"], name: "index_sale_details_on_sale_id"
  end

  create_table "sale_types", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "category"
  end

  create_table "sales", force: :cascade do |t|
    t.bigint "seller_id"
    t.bigint "buyer_id"
    t.bigint "total"
    t.string "uid", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
    t.bigint "sale_type_id"
    t.index ["sale_type_id"], name: "index_sales_on_sale_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "sale_concepts", "games"
  add_foreign_key "sale_concepts", "sales"
  add_foreign_key "sale_details", "sales"
  add_foreign_key "sales", "clients", column: "buyer_id"
  add_foreign_key "sales", "sale_types"
  add_foreign_key "sales", "users", column: "seller_id"

  create_view "sales_reports", materialized: true, sql_definition: <<-SQL
      SELECT s.id,
      s.created_at,
      s.updated_at,
      s.total,
      s.status,
      st.name AS sale_type,
      st.category,
      sd.currency,
      sd.country
     FROM ((sales s
       JOIN sale_details sd ON ((sd.sale_id = s.id)))
       JOIN sale_types st ON ((st.id = s.sale_type_id)));
  SQL
  add_index "sales_reports", ["category"], name: "index_sales_reports_on_category"
  add_index "sales_reports", ["country"], name: "index_sales_reports_on_country"
  add_index "sales_reports", ["created_at"], name: "index_sales_reports_on_created_at"
  add_index "sales_reports", ["currency"], name: "index_sales_reports_on_currency"
  add_index "sales_reports", ["id"], name: "index_sales_reports_on_id"
  add_index "sales_reports", ["sale_type"], name: "index_sales_reports_on_sale_type"
  add_index "sales_reports", ["status"], name: "index_sales_reports_on_status"
  add_index "sales_reports", ["updated_at"], name: "index_sales_reports_on_updated_at"

end
