require 'http'
require 'json'
require 'byebug'
## Api request stuff

all_plants_url = "http://www.tropicalfruitandveg.com/api/tfvjsonapi.php?search=all"


def fetchAllPlants(url)
    puts 'fetch all plants'
    all_plants_json = HTTP.get(url).to_s
    resp =  JSON.parse(all_plants_json)
    fetchFromResults(resp["results"])
end

def fetchFromResults(resArr)
    resArr.pop
    resArr.map {|r| fetchSpecificPlant(r['tfvname'])}
end

def parse_name(name)
    name.gsub(' ','%20')
end

def parse_fields(field) 
    field.gsub("\\x96|\\xAD", " -   ")
end

def fetchSpecificPlant(plant_name)
    specific_plant_url = "http://tropicalfruitandveg.com/api/tfvjsonapi.php?tfvitem="
    name = parse_name(plant_name)
    sleep 5
    puts "fetching #{name}"
    resp =  HTTP.get(specific_plant_url + name).to_s
    plant = JSON.parse(resp)
    create_plant(plant["results"][0])
end

def create_plant(plant)
    byebug
    
        Plant.create(name: plant["tfvname"], bot_name: plant["botname"], alt_name: plant["othname"], img_url: plant["imageurl"],description: plant["description"],
        uses: plant["uses"],
        health: plant["health"],
        climate: plant["climate"],
        soil: plant["soil"],
        propagation: plant["propagation"])
    rescue ActiveRecord::StatementInvalid => e
        puts e
    puts "created #{plant["tfvname"]}"
end
byebug
puts 'starting plants seed'
fetchAllPlants(all_plants_url)

# PlantGrowth.create(name: "Almond", harvest_s: 60, maturity_s: 146)
# PlantGrowth.create(name: "Tropical Almond")
# PlantGrowth.create(name: "Amla", pot_s: 10, protect_s: 36)
# PlantGrowth.create(name: "Aubergine", harvest_s: 6)
# PlantGrowth.create(name: "Bael Fruit", harvest_s: 60, harvest_f: 84)
# PlantGrowth.create(name: "Banana", flowering_s: 10, flowering_f: 17)
# PlantGrowth.create(name: "Cacao", fruiting_s: 60, harvest_s: 65, harvest_f: 66)
# PlantGrowth.create(name: "Calamondin", fertilize_s: 4, fruiting_s: 24, fruiting_f:36)
# PlantGrowth.create(name: "Carambola", bloom_s: 36, fruiting_s: 38)
# PlantGrowth.create(name: "Cashew", harvest_s: 24, harvest_f: 36)
# PlantGrowth.create(name: "Cashew Apple")
# PlantGrowth.create(name: "Chili Pepper", fruiting_s: 2, fruiting_f: 4, outside_s: 2, outside_f: 3)
# PlantGrowth.create(name: "Clove", flowering_s: 72, harvest_s: 180, harvest_f: 240)
# PlantGrowth.create(name: "Bora Berry")
# PlantGrowth.create(name: "Cocunut", sprouting_s: 9)
# PlantGrowth.create(name: "Corainder", germinate_s: 1)
# PlantGrowth.create(name: "Custard Apple", flowering_s: 12, flowering_f: 24, fruiting_s: 36, fruiting_f: 48)
# PlantGrowth.create(name: "Dill", sprouting_s: 1)
# PlantGrowth.create(name: "Dragon Fruit")
# PlantGrowth.create(name: "Dudhi", fruiting_s: 72, harvest_s: 73)
# PlantGrowth.create(name: "Durian", fruiting_s: 48, fruiting_f: 60, harvest_s: 55, harvest_f: 67)
# PlantGrowth.create(name: "Fennel", fruiting_s: 6)
# PlantGrowth.create(name: "Fenugreek", flowering_s: 3, flowering_f: 4, harvest_s: 6, harvest_f: 9)
# PlantGrowth.create(name: "Fig", fruiting_s: 36, fruiting_f: 60)
# PlantGrowth.create(name: "Millet", harvest_s: 3)
# PlantGrowth.create(name: "Ginger", harvest_s: 10, harvest_f: 12)
# PlantGrowth.create(name: "Gisuri")
# PlantGrowth.create(name: "Guar", harvest_s: 4, harvest_f: 5)
# PlantGrowth.create(name: "Guava", germinate_s: 1, fruiting_s: 24, fruiting_f: 36, harvest_s: 26, harvest_f: 39)
# PlantGrowth.create(name: "Gunda")
# PlantGrowth.create(name: "Hazelnut", harvest_s: 24, harvest_f: 60)
# PlantGrowth.create(name: "JackFruit", fruiting_s: 35.7, fruiting_f: 47.7, harvest_s: 36, harvest_f: 48)
# PlantGrowth.create(name: "Jambolan", germinate_s: 1, fruiting_s: 60, fruiting_f: 84, harvest_s: 64, harvest_f: 88)
# PlantGrowth.create(name: "Java Apple")
# PlantGrowth.create(name: "Kiwi", fruiting_s: 36, fruiting_f: 48, harvest_s: 48, harvest_f: 60)
# PlantGrowth.create(name: "Langsat", germinate_s: 0, germinate_f: 1, fruiting_s: 84, harvest_s: 120)
# PlantGrowth.create(name: "Curry Leaf", germinate_s: 1, harvest_s: 12, harvest_f: 24)
# PlantGrowth.create(name: "Lime", fruiting_s: 36, fruiting_f: 72, harvest_s: 96, harvest_f: 120)
# PlantGrowth.create(name: "Longan", germinate_s: 0, germinate_f: 1, outside_s: 24, outside_f: 36)
# PlantGrowth.create(name: "Loquat", fruiting_s: 90, harvest_s: 96, harvest_f: 120)
# PlantGrowth.create(name: "Lychee", harvest_s: 120, harvest_f: 180)
# PlantGrowth.create(name: "Macadamia", harvest_s: 84, maturity_s: 134)
# PlantGrowth.create(name: "Mango", germinate_s: 0, germinate_f: 1, fruiting_s: 55, harvest_s: 60)
# PlantGrowth.create(name: "Mangosteen", sprouting_s: 0, sprouting_f: 1, harvest_s: 24, harvest_f: 36)
# PlantGrowth.create(name: "Moringa", bloom_s: 8)
# PlantGrowth.create(name: "Naranjilla", bloom_s: 5, fruiting_s: 10, fruiting_f: 12)
# PlantGrowth.create(name: "Neem", germinate_s: 0, germinate_f: 1, fruiting_s: 36, fruiting_f: 60, maturity_s: 120)
# PlantGrowth.create(name: "Nutmeg", harvest_s: 84, harvest_f: 109, maturity_s: 240)
# PlantGrowth.create(name: "Okra", germinate_s: 0, germinate_f: 1, harvest_s: 2.5, harvest_f: 3)
# PlantGrowth.create(name: "Olive", fruiting_s: 60, maturity_s: 84, maturity_f: 96)
# PlantGrowth.create(name: "Oregano", harvest_s: 3)
# PlantGrowth.create(name: "Papaya", harvest_s: 8, harvest_f: 11)
# PlantGrowth.create(name: "Passionfruit", fruiting_s: 12, fruiting_f: 18, maturity_s: 28)
# PlantGrowth.create(name: "Peanut", flowering_s: 1, harvest_s: 4, harvest_f: 5)
# PlantGrowth.create(name: "Pecan", harvest_s: 24, maturity_s: 60, maturity_f: 84)
# PlantGrowth.create(name: "Persimmon", bloom_s: 60, fruiting_s: 84, maturity_s: 120)
# PlantGrowth.create(name: "Physalis", germinate_s: 1)
# PlantGrowth.create(name: "Pineapple", flowering_s: 24, flowering_f: 28, harvest_s: 30, harvest_f: 34)
# PlantGrowth.create(name: "Pistachio", harvest_s: 60, maturity_s: 120, maturity_f: 180)
# PlantGrowth.create(name: "Pomegranate", fruiting_s: 36, fruiting_f: 48, harvest_s: 60, harvest_f: 72)
# PlantGrowth.create(name: "Pineapple Guava", fruiting_s: 96, harvest_s: 104)
# PlantGrowth.create(name: "Pommelo", fruiting_s: 96, maturity_s: 132)
# PlantGrowth.create(name: "Prickly Pear", fruiting_s: 36, fruiting_f: 48, harvest_s: 48)
# PlantGrowth.create(name: "Rambutan", germinate_s: 0, germinate_f: 1, fruiting_s: 60, fruiting_f: 72, harvest_s: 120)
# PlantGrowth.create(name: "Rosemary", germinate_s: 0, germinate_f: 1)
# PlantGrowth.create(name: "Sapodilla", fruiting_s: 60, fruiting_f: 96, maturity_s: 120, maturity_f: 134)
# PlantGrowth.create(name: "Sugar Apple", germinate_s: 1, harvest_s: 36, harvest_f: 48)
# PlantGrowth.create(name: "Star Anise", harvest_s: 72)
# PlantGrowth.create(name: "Strawberry Guava", germinate_s: 1, germinate_f: 3, harvest_s: 96)
# PlantGrowth.create(name: "Sugarcane", sprouting_s: 3, harvest_s: 12, harvest_f: 18)
# PlantGrowth.create(name: "Tamarillo", harvest_s: 18, harvest_f: 20)
# PlantGrowth.create(name: "Tamarind", fruiting_s: 36, fruiting_f: 48, harvest_s: 72)
# PlantGrowth.create(name: "Tindora", harvest_s: 3)
# PlantGrowth.create(name: "Turmeric", harvest_s: 10)
# PlantGrowth.create(name: "Zalacca")
# PlantGrowth.create(name: "Wood Apple", fruiting_s: 60, harvest_s: 72, maturity_s: 80)
# PlantGrowth.create(name: "Mooli", harvest_s: 1)
# PlantGrowth.create(name: "Karela", germinate_s: 0, germinate_f: 1, harvest_s: 3)
# PlantGrowth.create(name: "Mung", harvest_s: 3, harvest_f: 4)
# PlantGrowth.create(name: "Adzuki")
# PlantGrowth.create(name: "Urad")
# PlantGrowth.create(name: "Chickpea", harvest_s: 3.5)
# PlantGrowth.create(name: "Lentil", sprouting_s: 0, sprouting_f: 1, harvest_s: 3, harvest_f: 4)
# PlantGrowth.create(name: "Manila tamarind", harvest_s: 60, harvest_f: 72)
# PlantGrowth.create(name: "Sesame", flowering_s: 1, harvest_s: 3, harvest_f: 4)
# PlantGrowth.create(name: "Sittu")
# PlantGrowth.create(name: "Avocado", sprouting_s: 2, sprouting_f: 6, harvest_s: 120, harvest_f: 180)
# PlantGrowth.create(name: "Date Palm", fruiting_s: 48, fruiting_f: 96, harvest_s: 84, harvest_f: 120)
# PlantGrowth.create(name: "Mustard", germinate_s: 0, germinate_f: 1, flowering_s: 2)
# PlantGrowth.create(name: "Tulsi", germinate_s: 0, germinate_f: 1, outside_s: 1.5, outside_f: 2)
# PlantGrowth.create(name: "Kantola", harvest_s: 3, harvest_f: 4)
# PlantGrowth.create(name: "Bora Jujube", maturity_s: 360)
# PlantGrowth.create(name: "Doringu")
# PlantGrowth.create(name: "Mogri", harvest_s: 2, harvest_f: 3)
# PlantGrowth.create(name: "Tuar")
# PlantGrowth.create(name: "Vanilla", sprouting_s: 5, sprouting_f: 9, fruiting_s: 36, harvest_s: 48)
# PlantGrowth.create(name: "Pepper")
# PlantGrowth.create(name: "Betelnut", germinate_s: 3, fruiting_s: 72, fruiting_f: 120, maturity_s: 240, maturity_f: 500)
# PlantGrowth.create(name: "Breadfruit", fruiting_s: 24, fruiting_f: 36, maturity_s: 60, maturity_f: 72)
# PlantGrowth.create(name: "Cassava", fruiting_s: 9, fruiting_f: 12, harvest_s: 36)