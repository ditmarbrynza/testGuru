# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# user = User.first
# user.update(type: "Admin")

# css = Category.create(title: "Css")
# js = Category.create(title: "Js")
# react = Category.create(title: "React")

# animation = Test.create(title: "Animation", level: 1, category_id: css.id, user_id: user.id)
# flexbox = Test.create(title: "Flexbox", level: 2, category_id: css.id, user_id: user.id)
# grid = Test.create(title: "Grid", level: 3, category_id: css.id, user_id: user.id)

# dom = Test.create(title: "DOM", level: 1, category_id: js.id, user_id: user.id)
# events = Test.create(title: "Events", level: 2, category_id: js.id, user_id: user.id)
# es6 = Test.create(title: "ES6", level: 3, category_id: js.id, user_id: user.id)

# props =  Test.create(title: "Props", level: 1, category_id: react.id, user_id: user.id)
# components =  Test.create(title: "Components", level: 2, category_id: react.id, user_id: user.id)
# redux =  Test.create(title: "Redux", level: 3, category_id: react.id, user_id: user.id)

# animation_question = Question.create(body: "What is CSS Animation?", test_id: animation.id)
# flexbox_question = Question.create(body: "What is Flexboxes?", test_id: flexbox.id)
# grid_question = Question.create(body: "What is CSS Grid?", test_id: grid.id)

# dom_question = Question.create(body: "What is DOM?", test_id: dom.id)
# events_question = Question.create(body: "What is JS Events?", test_id: events.id)
# es6_question = Question.create(body: "What is ES6?", test_id: es6.id)

# props_question = Question.create(body: "What is Props?", test_id: props.id)
# components_question = Question.create(body: "What is Components?", test_id: components.id)
# redux_question = Question.create(body: "What is Redux?", test_id: redux.id)

# animation_answer = Answer.create(body: "It is methods for create animations with css.", correct: true, question_id: animation_question.id)
# flexbox_answer = Answer.create(body: "Flexible Box Layout Module.", correct: true, question_id: flexbox_question.id)
# grid_answer = Answer.create(body: "CSS Grid Layout is a two-dimensional grid for CSS.", correct: true, question_id: grid_question.id)

# dom_answer = Answer.create(body: "DOM is a representation of a document in the form of a tree of objects, which can be modified through JavaScript.", correct: true, question_id: dom_question.id)
# events_answer = Answer.create(body: "An event is a signal from the browser that something has happened.", correct: true, question_id: events_question.id)
# es6_answer = Answer.create(body: "ECMAScript 6 is also known as ES6 and ECMAScript 2015. ", correct: true, question_id: es6_question.id)

# props_answer = Answer.create(body: "Arbitrary data of React components which called props (properties).", correct: true, question_id: props_question.id)
# components_answer = Answer.create(body: "Components are the blocks of React app which have own layout and properties.", correct: true, question_id: components_question.id)
# redux_answer = Answer.create(body: "A predictable state container for JavaScript apps.", correct: true, question_id: redux_question.id)

# users = User.create([ 
#   {email: "user1@gmail.com", role: "user"},
#   {email: "user2@gmail.com", role: "user"},
#   {email: "user3@gmail.com", role: "user"},
#   {email: "user4@gmail.com", role: "user"},
#   {email: "user5@gmail.com", role: "user"},
#   {email: "iam@gmail.com", role: "admin"}
# ])

# user1 = User.create(email: "user1@gmail.com", role: "user")
# user2 = User.create(email: "user2@gmail.com", role: "user")
# user3 = User.create(email: "user3@gmail.com", role: "user")
# user4 = User.create(email: "user4@gmail.com", role: "user")
# user5 = User.create(email: "user5@gmail.com", role: "admin")

# complited_test1 = ComplitedTest.create(user_id: user1.id, test_id: animation.id)
# complited_test2 = ComplitedTest.create(user_id: user1.id, test_id: flexbox.id)
# complited_test3 = ComplitedTest.create(user_id: user1.id, test_id: grid.id)

# complited_test4 = ComplitedTest.create(user_id: user2.id, test_id: animation.id)
# complited_test5 = ComplitedTest.create(user_id: user2.id, test_id: flexbox.id)
# complited_test6 = ComplitedTest.create(user_id: user2.id, test_id: grid.id)
# complited_test7 = ComplitedTest.create(user_id: user2.id, test_id: dom.id)
# complited_test8 = ComplitedTest.create(user_id: user2.id, test_id: events.id)
# complited_test9 = ComplitedTest.create(user_id: user2.id, test_id: es6.id)

# complited_test10 = ComplitedTest.create(user_id: user3.id, test_id: animation.id)

# complited_test11 = ComplitedTest.create(user_id: user4.id, test_id: animation.id)
# complited_test12 = ComplitedTest.create(user_id: user4.id, test_id: flexbox.id)

# complited_test13 = ComplitedTest.create(user_id: user5.id, test_id: events.id) 

ruby = Category.create(title: "Ruby")
rails = Category.create(title: "Rails")

easy_badge = Badge.create(title: "Easy Tests", image_url: "http://localhost:3000/assets/easy_badge.svg", condition: {"level": 0})
elementary_badge = Badge.create(title: "Elementary Tests", image_url: "http://localhost:3000/assets/elementary_badge.svg", condition: {"level": 1})
advanced_badge = Badge.create(title: "Advanced Tests", image_url: "http://localhost:3000/assets/advanced_badge.svg", condition: {"level": 2})
hard_badge = Badge.create(title: "Hard Tests", image_url: "http://localhost:3000/assets/hard_badge.svg", condition: {"level": 3})
ruby_badge = Badge.create(title: "Ruby Tests", image_url: "http://localhost:3000/assets/ruby_badge.svg", condition: {"category": ruby.id})
rails_badge = Badge.create(title: "Rails Tests", image_url: "http://localhost:3000/assets/rails_badge.svg", condition: {"category": rails.id})
first_try_badge = Badge.create(title: "First Try Tests", image_url: "http://localhost:3000/assets/first_try_badge.svg", condition: {"first_try": true})