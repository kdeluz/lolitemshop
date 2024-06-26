class ItemsController < ApplicationController
    def index
      @items = Item.all
    end
  
    def show
      @item = Item.find(params[:id])
    end

    private

    def update_stats(item, stats_data)
      return unless stats_data
  
      stat = item.build_stat
      stat.flat_hp_pool_mod = stats_data['FlatHPPoolMod'] || 0.0
      stat.flat_mp_pool_mod = stats_data['FlatMPPoolMod'] || 0.0
      stat.flat_hp_regen_mod = stats_data['FlatHPRegenMod'] || 0.0
      stat.flat_mp_regen_mod = stats_data['FlatMPRegenMod'] || 0.0
      stat.flat_armor_mod = stats_data['FlatArmorMod'] || 0.0
      stat.flat_magic_resist_mod = stats_data['FlatSpellBlockMod'] || 0.0
      stat.flat_attack_damage_mod = stats_data['FlatPhysicalDamageMod'] || 0.0
      stat.flat_ability_power_mod = stats_data['FlatMagicDamageMod'] || 0.0
      stat.flat_movement_speed_mod = stats_data['FlatMovementSpeedMod'] || 0.0
      stat.percent_hp_pool_mod = stats_data['PercentHPPoolMod'] || 0.0
      stat.percent_mp_pool_mod = stats_data['PercentMPPoolMod'] || 0.0
      stat.percent_hp_regen_mod = stats_data['PercentHPRegenMod'] || 0.0
      stat.percent_mp_regen_mod = stats_data['PercentMPRegenMod'] || 0.0
      stat.percent_armor_mod = stats_data['PercentArmorMod'] || 0.0
      stat.percent_magic_resist_mod = stats_data['PercentSpellBlockMod'] || 0.0
      stat.percent_attack_damage_mod = stats_data['PercentPhysicalDamageMod'] || 0.0
      stat.percent_ability_power_mod = stats_data['PercentMagicDamageMod'] || 0.0
      stat.percent_movement_speed_mod = stats_data['PercentMovementSpeedMod'] || 0.0
      stat.flat_critical_strike_chance_mod = stats_data['FlatCritChanceMod'] || 0.0
      stat.flat_attack_speed_mod = stats_data['FlatAttackSpeedMod'] || 0.0
      stat.percent_attack_speed_mod = stats_data['PercentAttackSpeedMod'] || 0.0
      stat.flat_life_steal_mod = stats_data['FlatLifeStealMod'] || 0.0
      stat.percent_life_steal_mod = stats_data['PercentLifeStealMod'] || 0.0
      stat.save!
    end
  end
  