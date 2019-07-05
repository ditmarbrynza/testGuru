# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
test = Test.create(title: "Animation", level: 1, category_id: 1)
test = Test.create(title: "Flexbox", level: 2, category_id: 1)
test = Test.create(title: "Grid", level: 3, category_id: 1)

test = Test.create(title: "DOM", level: 1, category_id: 2)
test = Test.create(title: "Events", level: 2, category_id: 2)
test = Test.create(title: "ES6", level: 3, category_id: 2)

test =  Test.create(title: "Props", level: 1, category_id: 3)
test =  Test.create(title: "Components", level: 2, category_id: 3)
test =  Test.create(title: "Redux", level: 3, category_id: 3)