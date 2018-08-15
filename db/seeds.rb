# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Food.find_or_create_by!(name: 'Chipotle Tacos', calories: 950)
Food.find_or_create_by!(name: 'Breakfast Bar', calories: 200)
Food.find_or_create_by!(name: 'Bacon and Jalapeño Mac & Cheese', calories: 1200)

Meal.find_or_create_by!(id: 1, name: 'Breakfast')
Meal.find_or_create_by!(id: 2, name: 'Snack')
Meal.find_or_create_by!(id: 3, name: 'Lunch')
Meal.find_or_create_by!(id: 4, name: 'Dinner')
