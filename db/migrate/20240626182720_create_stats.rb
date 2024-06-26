class CreateStats < ActiveRecord::Migration[7.1]
  def change
    create_table :stats do |t|
      t.references :item, null: false, foreign_key: true
      t.float :flat_hp_pool_mod
      t.float :flat_mp_pool_mod
      t.float :flat_hp_regen_mod
      t.float :flat_mp_regen_mod
      t.float :flat_armor_mod
      t.float :flat_magic_resist_mod
      t.float :flat_attack_damage_mod
      t.float :flat_ability_power_mod
      t.float :flat_movement_speed_mod
      t.float :percent_hp_pool_mod
      t.float :percent_mp_pool_mod
      t.float :percent_hp_regen_mod
      t.float :percent_mp_regen_mod
      t.float :percent_armor_mod
      t.float :percent_magic_resist_mod
      t.float :percent_attack_damage_mod
      t.float :percent_ability_power_mod
      t.float :percent_movement_speed_mod
      t.float :flat_critical_strike_chance_mod
      t.float :flat_attack_speed_mod
      t.float :percent_attack_speed_mod
      t.float :flat_life_steal_mod
      t.float :percent_life_steal_mod

      t.timestamps
    end
  end
end
