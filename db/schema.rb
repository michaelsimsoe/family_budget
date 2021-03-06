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

ActiveRecord::Schema.define(version: 2018_05_26_081158) do

  create_table "family_budgets", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "description"
    t.index ["user_id"], name: "index_family_budgets_on_user_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "family_budget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_budget_id"], name: "index_invitations_on_family_budget_id"
    t.index ["user_id"], name: "index_invitations_on_user_id"
  end

  create_table "member_requests", force: :cascade do |t|
    t.integer "family_budget_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_budget_id"], name: "index_member_requests_on_family_budget_id"
    t.index ["user_id"], name: "index_member_requests_on_user_id"
  end

  create_table "people", force: :cascade do |t|
    t.integer "family_budget_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_budget_id"], name: "index_people_on_family_budget_id"
  end

  create_table "person_budget_notations", force: :cascade do |t|
    t.integer "person_id"
    t.string "title"
    t.text "description"
    t.string "notation_type"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sub_budget_id"
    t.index ["person_id"], name: "index_person_budget_notations_on_person_id"
    t.index ["sub_budget_id"], name: "index_person_budget_notations_on_sub_budget_id"
  end

  create_table "sub_budget_notations", force: :cascade do |t|
    t.integer "sub_budget_id"
    t.string "title"
    t.text "description"
    t.string "notation_type"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "person_budget_notation_id"
    t.index ["person_budget_notation_id"], name: "index_sub_budget_notations_on_person_budget_notation_id"
    t.index ["sub_budget_id"], name: "index_sub_budget_notations_on_sub_budget_id"
  end

  create_table "sub_budgets", force: :cascade do |t|
    t.integer "family_budget_id"
    t.string "title"
    t.text "description"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_budget_id"], name: "index_sub_budgets_on_family_budget_id"
  end

  create_table "user_budgets", force: :cascade do |t|
    t.integer "user_id"
    t.integer "family_budget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_budget_id"], name: "index_user_budgets_on_family_budget_id"
    t.index ["user_id"], name: "index_user_budgets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "first_time", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
