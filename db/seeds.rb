# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "ready"
Vinyl.destroy_all
Genre.destroy_all
Artist.destroy_all
User.destroy_all

puts "set"

user1 = User.create!(email: "stef@me.fr", password: "azerty")

genre1 = Genre.create!(name: "folk")
artist1 = Artist.create!(name: "taylor")

Vinyl.create!(name: "USA", year: "2025", time: "30", artist_id: artist1.id, genre_id: genre1.id, user_id: user1.id)

puts "ok seed"
