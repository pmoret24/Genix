# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Chatroom.create(name: "general")
User.create(email: "sebastien@lewagon.org", first_name: "Sebastien", password: "123456")
User.create(email: "boris@lewagon.org", first_name: "Boris", password: "123456")
