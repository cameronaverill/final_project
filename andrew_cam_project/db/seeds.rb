# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Diet.destroy_all

Diet.create! name: "pescetarian"
Diet.create! name: "lacto vegetarian"
Diet.create! name: "ovo vegetarian"
Diet.create! name: "vegetarian"
Diet.create! name: "vegan"
Diet.create! name: "none", id: 0

User.destroy_all
cameron = User.create! email: "cra2126@columbia.edu", password: "password", password_confirmation: "password"

Dish.destroy_all
test = Dish.create! name: "Test Dish", url: "https://www.google.com", vegan: true, vegetarian: true, cheap: false, servings: 4


Dish.all.each { |dish| cameron.dishes << dish }

