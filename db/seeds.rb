# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'open-uri'
require 'json'

Item.destroy_all
Stat.destroy_all
Gold.destroy_all
Tag.destroy_all
ItemTag.destroy_all

api_key = 'REMOVED_KEY'
url = "https://ddragon.leagueoflegends.com/cdn/14.13.1/data/en_US/item.json?api_key=#{api_key}"
items_data = JSON.parse(URI.open(url).read)['data']

items_data.each do |key, item|
  created_item = Item.create(
    name: item['name'],
    description: item['description'],
    plaintext: item['plaintext'],
    image: "https://ddragon.leagueoflegends.com/cdn/14.13.1/img/item/#{item['image']['full']}"
  )

  if created_item.persisted?
    created_item.create_gold(
      total: item['gold']['total'],
      base: item['gold']['base'],
      sell: item['gold']['sell'],
      purchasable: item['gold']['purchasable']
    )

    stats = item['stats']
    if stats.present?
      created_item.create_stat(
        flat_hp_pool_mod: stats['FlatHPPoolMod'] || 0.0,
        flat_mp_pool_mod: stats['FlatMPPoolMod'] || 0.0,
        flat_hp_regen_mod: stats['FlatHPRegenMod'] || 0.0,
        flat_mp_regen_mod: stats['FlatMPRegenMod'] || 0.0,
        flat_armor_mod: stats['FlatArmorMod'] || 0.0,
        flat_magic_resist_mod: stats['FlatSpellBlockMod'] || 0.0,
        flat_attack_damage_mod: stats['FlatPhysicalDamageMod'] || 0.0,
        flat_ability_power_mod: stats['FlatMagicDamageMod'] || 0.0,
        flat_movement_speed_mod: stats['FlatMovementSpeedMod'] || 0.0,
        percent_hp_pool_mod: stats['PercentHPPoolMod'] || 0.0,
        percent_mp_pool_mod: stats['PercentMPPoolMod'] || 0.0,
        percent_hp_regen_mod: stats['PercentHPRegenMod'] || 0.0,
        percent_mp_regen_mod: stats['PercentMPRegenMod'] || 0.0,
        percent_armor_mod: stats['PercentArmorMod'] || 0.0,
        percent_magic_resist_mod: stats['PercentSpellBlockMod'] || 0.0,
        percent_attack_damage_mod: stats['PercentPhysicalDamageMod'] || 0.0,
        percent_ability_power_mod: stats['PercentMagicDamageMod'] || 0.0,
        percent_movement_speed_mod: stats['PercentMovementSpeedMod'] || 0.0,
        flat_critical_strike_chance_mod: stats['FlatCritChanceMod'] || 0.0,
        flat_attack_speed_mod: stats['FlatAttackSpeedMod'] || 0.0,
        percent_attack_speed_mod: stats['PercentAttackSpeedMod'] || 0.0,
        flat_life_steal_mod: stats['FlatLifeStealMod'] || 0.0,
        percent_life_steal_mod: stats['PercentLifeStealMod'] || 0.0
      )
    end

    item['tags'].each do |tag_name|
      tag = Tag.find_or_create_by(name: tag_name)
      ItemTag.create(item: created_item, tag: tag)
      puts "Created tag: #{tag_name} for item: #{created_item.name}"
    end
  else
    puts "Failed to create item: #{item['name']} - #{created_item.errors.full_messages.join(", ")}"
  end
end

puts "Seeded #{Item.count} items with stats"