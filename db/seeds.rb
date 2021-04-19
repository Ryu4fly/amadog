# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "-- Cleaning DB"
Booking.destroy_all
Review.destroy_all
User.delete_all

puts "-- Creating Users"
# Fake User for ease of logging in
User.create(
  email: "1@1.com",
  password: "123456",
  username: "Test",
  address: "Narita Airport, Narita, Chiba",
  bio: "Test bio"
)

User.create!(
  email: "nicholas@gmail.com",
  password: "amadog1",
  username: "Nicholas",
  address: "2-11-3 Meguro, Tokyo"
)

User.create!(
  email: "Christian@gmail.com",
  password: "amadog2",
  username: "Christian",
  address: "Haneda Airport, Ota City, Tokyo"
)

User.create!(
  email: "Edward@gmail.com",
  password: "amadog3",
  username: "Edward",
  address: "6-3-9 Akasaka, Minato City, Tokyo"
)

puts "-- Seeding Complete!"
