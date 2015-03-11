# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = Category.create([{ name: 'Computers'}, { name: 'Televisions' }, { name: 'Smart Phones' }, { name: 'Steroes' }, { name: 'Speakers' }, { name: 'Other' } ])

products = Product.create([
	{ name: 'MacBook Pro' , price: 1299.99, quantity: 10, description: 'The computer that does it all: surf the web! Skype your friends! Create a Ruby on Rails app!' , brand: 'Apple', category_id: 1 }, 
	{ name: 'Envy Laptop' , price: 649.99, quantity: 4, description: "HP's super cool laptop is for sale meow! Buy it today and it comes with Windows 8, buy it tomorrow and who knows." , brand: 'HP', category_id: 1 }, 
	{ name: 'G3' , price: 430.79, quantity: 2, description: "Introducting LG's lastest smart phone with Android software and it does stuff. You can even call people on this thing. Amazing!" , brand: 'LG', category_id: 3 }, 
	{ name: 'Optimus' , price: 340.29, quantity: 26, description: "This phone does everything. It slices, it dices, it tells you to call your mom even if she's passed away...because it has no concept of death." , brand: 'LG', category_id: 3 },
	{ name: 'iPhone 6' , price: 430.79, quantity: 0, description: "The new iPhone is basically the same as the old one, but now it bends or something. Let's be real, you're gonna buy it no matter what." , brand: 'Apple', category_id: 3 },
	{ name: 'LED TV 44"' , price: 600.88, quantity: 11, description: "It's a TV, what more do I have to say about it? Watch your favorite shows, watch shows that you hate, I don't really care." , brand: 'HP', category_id: 2 }
	])