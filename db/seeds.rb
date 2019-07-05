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

category = Category.create(title: "Css")
category = Category.create(title: "Js")
category = Category.create(title: "React")

question = Question.create(body: "What is CSS Animation?", test_id: 1)
question = Question.create(body: "What is Flexboxes?", test_id: 2)
question = Question.create(body: "What is CSS Grid?", test_id: 3)

question = Question.create(body: "What is DOM?", test_id: 4)
question = Question.create(body: "What is JS Events?", test_id: 5)
question = Question.create(body: "What is ES6?", test_id: 6)

question = Question.create(body: "What is Props?", test_id: 7)
question = Question.create(body: "What is Components?", test_id: 8)
question = Question.create(body: "What is Redux?", test_id: 9)

answer = Answer.create(body: "It is methods for create animations with css.", correct: true, question_id: 1)
answer = Answer.create(body: "Flexible Box Layout Module.", correct: true, question_id: 2)
answer = Answer.create(body: "CSS Grid Layout is a two-dimensional grid for CSS.", correct: true, question_id: 3)

answer = Answer.create(body: "DOM is a representation of a document in the form of a tree of objects, which can be modified through JavaScript.", correct: true, question_id: 4)
answer = Answer.create(body: "An event is a signal from the browser that something has happened.", correct: true, question_id: 5)
answer = Answer.create(body: "ECMAScript 6 is also known as ES6 and ECMAScript 2015. ", correct: true, question_id: 6)

answer = Answer.create(body: "Arbitrary data of React components which called props (properties).", correct: true, question_id: 7)
answer = Answer.create(body: "Components are the blocks of React app which have own layout and properties.", correct: true, question_id: 8)
answer = Answer.create(body: "A predictable state container for JavaScript apps.", correct: true, question_id: 9)

user = User.create(email: "user1@gmail.com", role: "user")
user = User.create(email: "user2@gmail.com", role: "user")
user = User.create(email: "user3@gmail.com", role: "user")
user = User.create(email: "user4@gmail.com", role: "user")
user = User.create(email: "user5@gmail.com", role: "user")
user = User.create(email: "iam@gmail.com", role: "admin")

