# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Category.create!(name: "Petiscos")
Category.create!(name: "Hambúrgueres")
Category.create!(name: "Drinks alcoólicos")

# Precos em centavos
Product.create!(name: "Pilotis", description: "300g de batata frita com sal de páprica.", price: 2200, category_id: 1)
Product.create!(name: "Asa Sul", description: "Bolinhas de mandioca.", price: 3000, category_id: 1)
Product.create!(name: "Feirinha da Torre", description: "Dadinhos de tapioca.", price: 1900, category_id: 1)
Product.create!(name: "Cruzeiro", description: "Anéis de cebola", price: 1800, category_id: 1)
Product.create!(name: "Araucárias", description: "Hambúrguer de carne(blend artesanal), cheddar, maionese de alho e bacon crocante no pão brioche.", price: 2700, category_id: 2)
Product.create!(name: "Castanheiras", description: "Hambúrguer de frango grelhado, com molho pesto, tomate, telha de parmesão e cebola roxa chapeada no pão brioche.", price: 2500, category_id: 2)
Product.create!(name: "Eduardo e Tônica", description: "Gin Yvy Ar, Xarope de morango, Morango e Água tônica.", price: 2800, category_id: 3)
Product.create!(name: "Eixão Mule", description: "Voska Premium, Purê de Lichia, Limão, Xarope de Mel e Espuma de Gengibre.", price: 2900, category_id: 3)
Product.create!(name: "Águas Claras", description: "Tequila, Xarope de Maracujá, Cointreau, Limão, Angustura Bitter, Flor de sal e Ginger Ale.", price: 3500, category_id: 3)
Product.create!(name: "Mango on The Beach", description: "Gin, Monster Mango Loco e Xarope de morango.", price: 2600, category_id: 3)

# Criei 2 Usuarios qualquer apenas para facilitar a visualizacao, um eh admin, outro nao
User.create!(name: "Arthur", email: "arthurantero@hotmail.com", password:"123456", isadmin: true)
User.find_by(id:1).photo.attach(io: File.open('./public/ArthurDesenhoQualquer.png'), filename: 'ArthurDesenhoQualquer.png')
User.create!(name: "Joao", email: "joao@hotmail.com", password:"123456", isadmin: false)
User.find_by(id:2).photo.attach(io: File.open('./public/JoaoDesenhoQualquer.jpg'), filename: 'JoaoDesenhoQualquer.jpg')

#Coloquei 1 produto favorito para cada um dos Usuarios que criei
ProductUser.create!(user_id: 1, product_id: 1)
ProductUser.create!(user_id: 2, product_id: 2)

