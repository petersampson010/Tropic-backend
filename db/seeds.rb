# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(username: "user1")
Growlist.create(user_id: 1, plant_id: 44)
Growlist.create(user_id: 1, plant_id: 21)
Wishlist.create(user_id: 1, plant_id: 55)
Wishlist.create(user_id: 1, plant_id: 15)
Wishlist.create(user_id: 1, plant_id: 95)

