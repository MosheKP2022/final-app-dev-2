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

ActiveRecord::Schema.define(version: 2022_05_27_230606) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "commenter_id", null: false
    t.bigint "offering_id", null: false
    t.text "body", null: false
    t.boolean "private", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["commenter_id"], name: "index_comments_on_commenter_id"
    t.index ["offering_id"], name: "index_comments_on_offering_id"
  end

  create_table "contact_us_messages", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_contact_us_messages_on_user_id"
  end

  create_table "family_members", force: :cascade do |t|
    t.bigint "parent_id", null: false
    t.bigint "kid_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kid_id"], name: "index_family_members_on_kid_id"
    t.index ["parent_id"], name: "index_family_members_on_parent_id"
  end

  create_table "kids", force: :cascade do |t|
    t.citext "first_name"
    t.citext "last_name"
    t.date "dob"
    t.text "about_me"
    t.citext "school"
    t.integer "family_members_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "parents_count", default: 0
  end

  create_table "labeled_offerings", force: :cascade do |t|
    t.bigint "offering_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["offering_id"], name: "index_labeled_offerings_on_offering_id"
    t.index ["tag_id"], name: "index_labeled_offerings_on_tag_id"
  end

  create_table "offerings", force: :cascade do |t|
    t.text "description"
    t.string "image"
    t.float "min_age"
    t.float "max_age"
    t.float "price"
    t.date "date"
    t.time "time"
    t.string "video"
    t.bigint "seller_id", null: false
    t.integer "comments_count", default: 0
    t.integer "labeled_offerings_count", default: 0
    t.integer "saves_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["seller_id"], name: "index_offerings_on_seller_id"
  end

  create_table "saves", force: :cascade do |t|
    t.bigint "offering_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["offering_id"], name: "index_saves_on_offering_id"
    t.index ["user_id"], name: "index_saves_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.integer "labeled_offerings_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "profile_picture"
    t.integer "phone"
    t.text "about_me"
    t.boolean "admin"
    t.integer "comments_count", default: 0
    t.integer "messages_to_administrators_count", default: 0
    t.integer "offerings_count", default: 0
    t.integer "kids_count", default: 0
    t.integer "saves_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "contact_us_messages_count", default: 0
    t.index ["phone"], name: "index_users_on_phone", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "offerings"
  add_foreign_key "comments", "users", column: "commenter_id"
  add_foreign_key "contact_us_messages", "users"
  add_foreign_key "family_members", "kids"
  add_foreign_key "family_members", "users", column: "parent_id"
  add_foreign_key "labeled_offerings", "offerings"
  add_foreign_key "labeled_offerings", "tags"
  add_foreign_key "offerings", "users", column: "seller_id"
  add_foreign_key "saves", "offerings"
  add_foreign_key "saves", "users"
end
