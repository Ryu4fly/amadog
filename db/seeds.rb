# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  email: "nicholas@gmail.com",
  username: "Nicholas",
  address: "2-11-3 Meguro, Tokyo",
  password: "amadog1"
)

User.create!(
  email: "Christian@gmail.com",
  username: "Christian",
  address: "Haneda Airport, Ota City, Tokyo",
  password: "amadog2"
)

User.create!(
  email: "Edward@gmail.com",
  username: "Edward",
  address: "6-3-9 Akasaka, Minato City, Tokyo",
  password: "amadog3"
)
