namespace :fetch do
    desc "Fetch items from API and store in database"
    task items: :environment do
      require 'open-uri'
  
      api_key = 'RGAPI-53ced869-7dcd-4613-a8f5-c8e41363f6f3'
      url = "https://ddragon.leagueoflegends.com/cdn/14.13.1/data/en_US/item.json?api_key=#{api_key}"
      items_data = JSON.parse(URI.open(url).read)['data']
  
      items_data.each do |key, item|
        Item.create!(
          name: item['name'],
          description: item['description'],
          gold: item['gold']['total'],
          tags: item['tags'].join(', '),
          plaintext: item['plaintext'],
          image: "https://ddragon.leagueoflegends.com/cdn/14.13.1/img/item/#{item['image']['full']}"
        )
      end
  
      puts "Items fetched and stored in database."
    end
  end
  