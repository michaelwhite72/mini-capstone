# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


my_product = Product.new({name: "fan", price: 10, description: "cooling device"})
my_product.save

my_product = Product.new({name: "Laptop", price: 900, description: "Portable computer"})
my_product.save

my_product = Product.new({name: "camera", price: 125, description: "Takes pitcures of important moments"})
my_product.save