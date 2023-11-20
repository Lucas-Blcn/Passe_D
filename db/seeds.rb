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
users = []
5.times do |i|
  users << User.create!(
    email: "user#{i + 1}@example.com",
    password: "password",
    pseudo: "User #{i + 1}",
    phone_number: "123456789#{i}"
  )
end

# Création de 5 produits pour chaque utilisateur
products = []
users.each do |user|
  5.times do |i|
    products << user.products.create!(
      title: "Product #{i + 1} by #{user.pseudo}",
      description: "Description for Product #{i + 1}",
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
