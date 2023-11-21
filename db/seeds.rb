# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "1- Cleaning DataBase"
Booking.destroy_all
Product.destroy_all
User.destroy_all

# Création de 5 utilisateurs
# users = ["AlainleGeudin", "Mathieulepeureux", "Omarlefroussard", "Antoninleradin", "Sarahlafada", "Bernadettelamalhônette"]
users_for_test = ["AlainleGeudin", "Mathieulepeureux", "Omarlefroussard", "Antoninleradin", "Sarahlafada", "Bernadettelamalhônette"]
users = []
puts "Création des users"
5.times do |i|
  users << User.create!(
    email: "user#{i+1}#{users_for_test[i+1]}@example.com",
    password: "password",
    # pseudo: "User #{i + 1}",
    pseudo: "#{users_for_test[i+1]}",
    phone_number: "123456789#{i}"
  )
end
puts "#Users: #{users}"

# Création de 5 produits pour chaque utilisateur
products_for_test = ["cycling bike", "surfboard", "ping-pong", "triplette", "paddleboard", "swim gear", "VTT", "motobike", "water skiing", "snowboard", "skiing"]
products = []
users.each do |user|
  5.times do |i|
    products << user.products.create!(
      # title: "Product by #{user.pseudo}",
      title: "My wonderful #{products_for_test[rand(0..11)]} - #{user.pseudo}",
      description: "This is my description for the above product #{i + 1}",
      price: rand(10..100)
    )
  end
end

# Création de 5 réservations pour chaque utilisateur et produit
bookings = []
users.each do |user|
  user.products.each do |product|
    bookings << Booking.create!(
      reviews: "Review for #{product.title} by #{user.pseudo}",
      rating: rand(1..5),
      transaction_booked: true,
      starting_date: Date.today,
      ending_date: Date.today + rand(1..30).days,
      user: user,
      product: product
    )
  end
end

puts "2- Creating users"

puts "3- #{User.count} created"

puts "2- Creating products"

puts "3- #{Product.count} products created"
puts "3- #{Booking.count} bookings created"
