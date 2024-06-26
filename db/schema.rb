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

ActiveRecord::Schema[7.1].define(version: 2024_06_26_182732) do
  create_table "golds", force: :cascade do |t|
    t.integer "total"
    t.integer "base"
    t.integer "sell"
    t.boolean "purchasable"
    t.integer "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_golds_on_item_id"
  end

  create_table "item_tags", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_tags_on_item_id"
    t.index ["tag_id"], name: "index_item_tags_on_tag_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "tags"
    t.string "plaintext"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stats", force: :cascade do |t|
    t.integer "item_id", null: false
    t.float "flat_hp_pool_mod"
    t.float "flat_mp_pool_mod"
    t.float "flat_hp_regen_mod"
    t.float "flat_mp_regen_mod"
    t.float "flat_armor_mod"
    t.float "flat_magic_resist_mod"
    t.float "flat_attack_damage_mod"
    t.float "flat_ability_power_mod"
    t.float "flat_movement_speed_mod"
    t.float "percent_hp_pool_mod"
    t.float "percent_mp_pool_mod"
    t.float "percent_hp_regen_mod"
    t.float "percent_mp_regen_mod"
    t.float "percent_armor_mod"
    t.float "percent_magic_resist_mod"
    t.float "percent_attack_damage_mod"
    t.float "percent_ability_power_mod"
    t.float "percent_movement_speed_mod"
    t.float "flat_critical_strike_chance_mod"
    t.float "flat_attack_speed_mod"
    t.float "percent_attack_speed_mod"
    t.float "flat_life_steal_mod"
    t.float "percent_life_steal_mod"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_stats_on_item_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "golds", "items"
  add_foreign_key "item_tags", "items"
  add_foreign_key "item_tags", "tags"
  add_foreign_key "stats", "items"
end
