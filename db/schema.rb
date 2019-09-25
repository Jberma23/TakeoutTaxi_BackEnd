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

ActiveRecord::Schema.define(version: 2019_09_25_132606) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.integer "favoriter_id"
    t.integer "favorited_id"
    t.index ["favorited_id"], name: "index_favorites_on_favorited_id"
    t.index ["favoriter_id"], name: "index_favorites_on_favoriter_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "truck_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "rater_id"
    t.integer "rated_id"
    t.integer "score"
    t.index ["rated_id"], name: "index_ratings_on_rated_id"
    t.index ["rater_id"], name: "index_ratings_on_rater_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "reviewer_id"
    t.integer "reviewed_id"
    t.string "content"
    t.index ["reviewed_id"], name: "index_reviews_on_reviewed_id"
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
  end

  create_table "trucks", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.string "image_url"
    t.string "url"
    t.integer "review_count"
    t.integer "rating"
    t.string "price"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "longitude"
    t.string "latitude"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "username"
    t.integer "role"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
