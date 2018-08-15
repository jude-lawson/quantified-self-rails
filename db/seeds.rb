# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Food.create!(name: 'Chipotle Tacos', calories: 950)
Food.create!(name: 'Breakfast Bar', calories: 200)
Food.create!(name: 'Bacon and Jalapeño Mac & Cheese', calories: 1200)

Meal.create!(name: 'Breakfast')
Meal.create!(name: 'Lunch')
Meal.create!(name: 'Dinner')
Meal.create!(name: 'Snacks')
