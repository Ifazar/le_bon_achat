require "open-uri"

# Product.destroy_all
# Establishment.destroy_all
# Ticket.destroy_all
# User.destroy_all


puts "Creating seed!"
# Creating Users
5.times do |i|
  User.create!(
    email: "user#{i + 1}@example.com",
    password: "password#{i + 1}" # Ideally, you should use a secure hashing algorithm
  )
end
# Creating Establishments
establishments_data = [
  {name: "tampon", address: "#", phone_number: "#", email: "#"},
  { name: "Recyclerie du Lombric", address: "9 Rue de la Plaine de la Croix Besnard, 77000 Vaux-le-Pénil", phone_number: "01xxxxxxxx", email: "contact@lombric.com" },
  { name: "Melun Centre", address: "22 Rue Paul Doumer, 77000 Melun", phone_number: "01xxxxxxxx", email: "info@meluncentre.com" },
  { name: "Zone Activité", address: "9 Rte de Nangis, 77000 Melun", phone_number: "01xxxxxxxx", email: "contact@zoneactivite.com" }
]
establishments_data.each do |establishment_data|
  Establishment.create!(establishment_data)
end
# Creating Tickets
5.times do |i|
  Ticket.create!(
    title: "Ticket ##{i + 1}",
    price: rand(10..100),
    color: ["Red", "Blue", "Green", "Yellow", "Pink"].sample,
    user: User.order("RANDOM()").first
  )
end
# Creating Products
products_data = [

  { title: "Velo VTT", category: "Sport", detail: "#", condition: "Bon état", price: 35, image:"https://res.cloudinary.com/diffnfduk/image/upload/v1701766813/development/0tvoqmx8sfkp80635dl48im618ov.jpg" },
  { title: "Télé Samsung", category: "Electrique", detail: "#", condition: "Moyen", price: 50, image: "https://res.cloudinary.com/diffnfduk/image/upload/v1701783972/tele2_x4uqad.jpg" },
  { title: "Commode de lit", category: "Mobilier", detail: "#", condition: "Usagé", price: 5, image: "https://res.cloudinary.com/diffnfduk/image/upload/v1701783975/commode1_coiv8p.jpg" },
  { title: "Tondeuse à gazon", category: "Jardinage", detail: "#", condition: "Bon état", price: 60, image: "https://res.cloudinary.com/diffnfduk/image/upload/v1701783973/tondeuse1jpg_p0wpbp.jpg" },
  { title: "Collection de Spirou", category: "Divertissement", detail: "#", condition: "Usagé", price: 4, image:"https://res.cloudinary.com/diffnfduk/image/upload/v1701783976/livre4_d8lswq.jpg"},
  { title: "Vieille Radio", category: "Electrique", detail: "#", condition: "Used", price: 30, image:"https://res.cloudinary.com/diffnfduk/image/upload/v1701689528/raido1_udbenl.jpg" },
  { title: "Chaise en bois", category: "Fourniture", detail: "#", condition: "New", price: 45, image: "https://res.cloudinary.com/diffnfduk/image/upload/v1701783975/chaise1_gqguzi.jpg" },
  { title: "Ruby Programming", category: "Livre", detail: "#", condition: "New", price: 20, image:"https://res.cloudinary.com/diffnfduk/image/upload/v1701783972/rubycode1_lourmf.jpg" },
  { title: "Mixeur de cuisine", category: "Electrique", detail: "#", condition: "Moyen", price: 10, image: "https://res.cloudinary.com/diffnfduk/image/upload/v1701783975/electromenage2_h1jarh.jpg" },
  { title: "Enceinte JBL", category: "Electrique", detail: "#", condition: "Très bon état", price: 90, image: "https://res.cloudinary.com/diffnfduk/image/upload/v1701783975/enceinte2_hkyfik.jpg" },
  { title: "Télé Sony", category: "Electrique", detail: "#", condition: "Bon état", price: 80, image: "https://res.cloudinary.com/diffnfduk/image/upload/v1701783973/tele1_vns5fu.jpg" },
  { title: "Vélo de route", category: "Sport", detail: "#", condition: "Moyen", price: 20, image: "https://res.cloudinary.com/diffnfduk/image/upload/v1701783973/velo2_iyuqvt.jpg" },
  { title: "Canapé", category: "Mobilier", detail: "#", condition: "Très bon état", price: 60, image: "https://res.cloudinary.com/diffnfduk/image/upload/v1701783974/canape_zhrfir.jpg" },
  { title: "PS4", category: "Electrique", detail: "#", condition: "Moyen", price: 20, image: "https://res.cloudinary.com/diffnfduk/image/upload/v1701783972/ps4_jcbajy.jpg" },
  { title: "Fauteuil", category: "Mobilier", detail: "#", condition: "Bon état", price: 40, image: "https://res.cloudinary.com/diffnfduk/image/upload/v1701783975/fauteuil1_zu0kou.jpg" },
  { title: "Téléphone portable nokia 3310", category: "Electronics", detail: "#", condition: "Usagé", price: 5, image: "https://res.cloudinary.com/diffnfduk/image/upload/v1701784428/telephone2_htfjms.jpg" },
  { title: "Tronçoneuse", category: "Outils", detail: "#", condition: "Bon état", price: 30, image: "https://res.cloudinary.com/diffnfduk/image/upload/v1701783973/tronconneuse_g8wlfj.jpg" },
  { title: "Naruto", category: "Manga", detail: "#", condition: "Moyen", price: 4, image: "https://res.cloudinary.com/diffnfduk/image/upload/v1701783972/naruto1_oqrbp4.jpg" },
  { title: "One Piece", category: "Manga", detail: "#", condition: "Très bon état", price: 8, image: "https://res.cloudinary.com/diffnfduk/image/upload/v1701783972/onepiece_ofumyp.jpg" },
  { title: "PC portable", category: "Electrique", detail: "#", condition: "Très bon état", price: 80, image: "https://res.cloudinary.com/diffnfduk/image/upload/v1701783972/ordinateur1_gcts3y.jpg" },
  { title: "Jujutsu Kaisen", category: "Manga", detail: "#", condition: "Très bon état", price: "8", image: "https://res.cloudinary.com/diffnfduk/image/upload/v1701849650/images_i0zo9o.jpg" },
  { title: "Lampe de bureau", category: "Décoration", detail: "#", condition: "Usage", price: "3", image: "https://res.cloudinary.com/diffnfduk/image/upload/v1701849650/images_1_lupkfn.jpg" },
  { title: "Miroir", category: "Décoration", detail: "#", condition: "Bon état", price: "15", image: "https://res.cloudinary.com/diffnfduk/image/upload/v1701849650/images_2_ue5sca.jpg" },
  { title: "Veste en cuir", category: "Mode", detail: "#", condition: "Bon état", price: "15", image: "https://res.cloudinary.com/diffnfduk/image/upload/v1701849650/images_3_vh1oq4.jpg" },
  { title: "Sac Lacoste", category: "Mode", detail: "#", condition: "Moyen", price: "10", image: "https://res.cloudinary.com/diffnfduk/image/upload/v1701849650/images_4_mivdax.jpg" },
  { title: "Service à thé", category: "Ameublement", detail: "#", condition: "Bon état", price: "15", image: "https://res.cloudinary.com/diffnfduk/image/upload/v1701849650/images_5_eg0l2f.jpg" },
  { title: "Kapla", category: "Jeux", detail: "#", condition: "Moyen", price: "10", image: "https://res.cloudinary.com/diffnfduk/image/upload/v1701849650/images_6_ugtuz2.jpg" },
  { title: "Circuit Voiture", category: "Jouet", detail: "#", condition: "Moyen", price: "5", image: "https://res.cloudinary.com/diffnfduk/image/upload/v1701849650/images_7_s90wnv.jpg" },
  { title: "Dictionnaire Larousse 2017", category: "LIvre", detail: "#", condition: "Bon état", price: "10", image: "https://res.cloudinary.com/diffnfduk/image/upload/v1701849650/images_8_xvh1gt.jpg" },
  { title: "Table basse", category: "Ameublement", detail: "#", condition: "Très bon état", price: "20", image: "https://res.cloudinary.com/diffnfduk/image/upload/v1701849650/images_9_giah0i.jpg" }
]
products_data.each do |product_data|
  Product.create!(
    product_data.merge(
      user: User.order("RANDOM()").first,
      establishment: Establishment.order("RANDOM()").first,
      ticket: Ticket.order("RANDOM()").first
    )
    )
# product.picture1 = File.open(Rails.root.join("db/pictures/garden1.jpg"))
# product.save
end
puts "Seed data created successfully!"



# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# puts "Creating user..."

# 5.times do |i|
#   email = "user#{i + 1}@example.com" # Generates emails like user1@example.com, user2@example.com, etc.
#   user = User.create(
#     email: email,
#     encrypted_password: 'password123' # Replace with a secure password hash
#   )
#   user.save!
# end
# puts "Finished creating users!"


# puts "Creating establishment..."
# recyclerie1 = { name: "Recyclerie du Lombric", address: "9 Rue de la Plaine de la Croix Besnard, 77000 Vaux-le-Pénil", phone_number: "01xxxxxxxx", email: "" }
# recyclerie2 = { name: "Melun Centre", address: "22 Rue Paul Doumer, 77000 Melun", phone_number: "01xxxxxxxx", email: "" }
# recyclerie3 = { name: "Zone Activité", address: "9 Rte de Nangis, 77000 Melun", phone_number: "01xxxxxxxx", email: "" }

# [recyclerie1, recyclerie2, recyclerie3].each do |establishment|
#   establishment = Establishment.create!(establishment)
#   puts "Created #{establishment.name}"
# end
# puts "Finished establishment!"

# puts "Creating tickets..."


# users = User.all
# establishments = Establishment.all


# users.each do |user|
#   3.times do
#     establishment = establishments.sample
#     Ticket.create!(
#       title: Faker::Lorem.sentence,
#       price: rand(1..50),
#       color: Faker::Color.hex_color,
#       user: user
#     )
#   end
# end

# puts "Finished creating tickets!"



# puts "Creating product..."

# product1 = { title: "Velo VTT", category: "Sport", detail: "#", condition: "Bon état", price: 35, user_id: ,establishment_id:, ticket_id: }
# product2 = { title: "Télé Samsung", category: "Electrique", detail: "#", condition: "Moyen", price: 50, user_id: ,establishment_id:, ticket_id: }
# product3 = { title: "Commode de lit", category: "Mobilier", detail: "#", condition: "Usagé", price: 5, user_id: ,establishment_id:, ticket_id: }
# product4 = { title: "Tondeuse à gazon", category: "Jardinage", detail: "#", condition: "Bon état", price: 60 , user_id: ,establishment_id:, ticket_id:}
# product5 = { title: "Collection de Spirou", category: "Divertissement", detail: "#", condition: "Usagé", price: 4, user_id: ,establishment_id:, ticket_id: }
# product6 = { title: "Mixeur de cuisine", category: "Electrique", detail: "#", condition: "Moyen", price: 10, user_id: ,establishment_id:, ticket_id: }
# product7 = { title: "Enceinte JBL", category: "Electrique", detail: "#", condition: "Très bonne état", price: 90, user_id: ,establishment_id:, ticket_id: }
# product8 = { title: "Télé Sony", category: "Electrique", detail: "#", condition: "Bon état", price: 80, user_id: ,establishment_id:, ticket_id: }
# product9 = { title: "Vélo de route", category: "SPort", detail: "#", condition: "Moyen", price: 20, user_id: ,establishment_id:, ticket_id: }
# product10 = { title: "Canapé", category: "Mobilier", detail: "#", condition: "Très bonne état", price: 60, user_id: ,establishment_id:, ticket_id: }

# [product1, product2, product3, product4, product5, product6, product7, product8, product9, product10].each do |product|
#   product = Product.create!(product)
#   puts "Created #{product.title}"
# end
# puts "Finished product!"
