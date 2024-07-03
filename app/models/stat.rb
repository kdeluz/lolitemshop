class Stat < ApplicationRecord
    belongs_to :item

    validates :flat_hp_pool_mod, numericality: true
    validates :flat_mp_pool_mod, numericality: true
    validates :flat_hp_regen_mod, numericality: true
    validates :flat_mp_regen_mod, numericality: true
    validates :flat_armor_mod, numericality: true
    validates :flat_magic_resist_mod, numericality: true
    validates :flat_attack_damage_mod, numericality: true
    validates :flat_ability_power_mod, numericality: true
    validates :flat_movement_speed_mod, numericality: true
    validates :percent_hp_pool_mod, numericality: true
    validates :percent_mp_pool_mod, numericality: true
    validates :percent_hp_regen_mod, numericality: true
    validates :percent_mp_regen_mod, numericality: true
    validates :percent_armor_mod, numericality: true
    validates :percent_magic_resist_mod, numericality: true
    validates :percent_attack_damage_mod, numericality: true
    validates :percent_ability_power_mod, numericality: true
    validates :percent_movement_speed_mod, numericality: true
    validates :flat_critical_strike_chance_mod, numericality: true
    validates :flat_attack_speed_mod, numericality: true
    validates :percent_attack_speed_mod, numericality: true
    validates :flat_life_steal_mod, numericality: true
    validates :percent_life_steal_mod, numericality: true
  end
  