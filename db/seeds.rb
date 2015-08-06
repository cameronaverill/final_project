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
cameron = User.create! email: "cra2126@columbia.edu", password: "password", password_confirmation: "password", name: 'Cam'

Dish.destroy_all


Intolerance.destroy_all
Intolerance.create! name: "dairy"
Intolerance.create! name: "egg"
Intolerance.create! name: "gluten"
Intolerance.create! name: "peanut"
Intolerance.create! name: "sesame"
Intolerance.create! name: "seafood"
Intolerance.create! name: "shellfish"
Intolerance.create! name: "soy"
Intolerance.create! name: "sulfite"
Intolerance.create! name: "tree nut"
Intolerance.create! name: "wheat"

Dish.all.each { |dish| cameron.dishes << dish }
cameron.intolerances << Intolerance.find_by(name: 'dairy')
cameron.intolerances << Intolerance.find_by(name: 'peanut')

Party.destroy_all
