# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def add_comments(review, user)
  Comment.create(
    body: "Are you kidding me, you idiot!",
    user: user,
    review: review
  )
  Comment.create(
    body: "Don't listen to that guy, you are dead on. He's the idiot",
    user: user,
    review: review
  )
  Comment.create(
    body: Faker::Hacker.say_something_smart,
    user: user,
    review: review
  )
end

user = User.new(email: "user@email.com", password: "password", password_confirmation: "password")

categories = [
  Category.new(name: "Languages"),
  Category.new(name: "Text Editors"),
  Category.new(name: "Frameworks"),
  Category.new(name: "Plugins, Gems, Libraries, etc."),
  Category.new(name: "APIs"),
  Category.new(name: "Native Apps"),
  Category.new(name: "Web Apps"),
  Category.new(name: "Service"),
  Category.new(name: "Miscellaneous")
]

100.times do |i|
  tool = Tool.create(
    user: user,
    name: "Dev Tool #{i}",
    description: Faker::Lorem.paragraphs.join(" "),
    category: categories.sample
  )
  good_review = Review.create(
    rating: 5,
    body: "It's awesome!",
    tool: tool,
    user: user
  )
  add_comments(good_review, user)
  bad_review = Review.create(
    rating: 1,
    body: "It's the worst!",
    tool: tool,
    user: user
  )
  add_comments(bad_review, user)
end
