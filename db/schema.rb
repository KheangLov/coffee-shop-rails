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

ActiveRecord::Schema.define(version: 20190226030421) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "description"
    t.string "address"
    t.string "phone"
    t.string "email"
    t.bigint "company_id"
    t.index ["company_id"], name: "index_branches_on_company_id"
  end

# Could not dump table "companies" because of following StandardError
#   Unknown type 'status' for column 'status'

  create_table "employees", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "branch_id"
    t.string "firstname"
    t.string "lastname"
    t.string "fullname"
    t.date "dob"
    t.string "address"
    t.string "phone"
    t.string "email"
    t.string "position"
    t.string "work_time"
    t.decimal "salary", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_employees_on_branch_id"
    t.index ["company_id"], name: "index_employees_on_company_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_product_categories_on_name"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "product_category_id"
    t.bigint "stock_id"
    t.string "name"
    t.decimal "price", precision: 10, scale: 2
    t.decimal "qty", precision: 10, scale: 2
    t.integer "sale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_products_on_name"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
    t.index ["stock_id"], name: "index_products_on_stock_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "descriptions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stock_categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "branch_id"
    t.bigint "company_id"
    t.index ["branch_id"], name: "index_stock_categories_on_branch_id"
    t.index ["company_id"], name: "index_stock_categories_on_company_id"
    t.index ["name"], name: "index_stock_categories_on_name"
  end

  create_table "stocks", force: :cascade do |t|
    t.bigint "stock_category_id"
    t.string "name"
    t.string "description"
    t.decimal "price", precision: 10, scale: 2
    t.decimal "sale_price", precision: 10, scale: 2
    t.date "expired_date"
    t.decimal "qty", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "branch_id"
    t.boolean "alerted"
    t.integer "alert_qty"
    t.string "status"
    t.index ["branch_id"], name: "index_stocks_on_branch_id"
    t.index ["name"], name: "index_stocks_on_name"
    t.index ["stock_category_id"], name: "index_stocks_on_stock_category_id"
  end

# Could not dump table "users" because of following StandardError
#   Unknown type 'gender' for column 'gender'

  add_foreign_key "branches", "companies"
  add_foreign_key "companies", "users"
  add_foreign_key "employees", "branches"
  add_foreign_key "employees", "companies"
  add_foreign_key "products", "product_categories"
  add_foreign_key "products", "stocks"
  add_foreign_key "stock_categories", "branches"
  add_foreign_key "stock_categories", "companies"
  add_foreign_key "stocks", "branches"
  add_foreign_key "stocks", "stock_categories"
  add_foreign_key "users", "roles"
end
