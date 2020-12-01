# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


jr = User.create!(email: "jr@gmail.com", password: "password")
km = User.create!(email: "km@gmail.com", password: "password")

tortillas = Product.create!(name: "tortillas", description: "tortillas para burritos.")
leche = Product.create!(name: "leche", description: "leche.")

listaUno = GroceryList.create!(title: "Lista Uno", active: true, user_id: jr.id)
