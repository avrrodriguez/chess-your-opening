ActiveRecord::Schema[7.0].define(version: 2022_11_07_195846) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "common_positions", force: :cascade do |t|
    t.text "description"
    t.string "image_url"
    t.string "variation"
    t.integer "opening_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "openings", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.text "description"
    t.string "difficulty"
    t.string "variation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resources", force: :cascade do |t|
    t.integer "opening_id"
    t.string "link"
    t.string "resource_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "studies", force: :cascade do |t|
    t.integer "user_id"
    t.integer "opening_id"
    t.text "notes"
    t.boolean "public", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
  end
end
