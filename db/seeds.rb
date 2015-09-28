# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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

100.times do
  tool = FactoryGirl.create(:tool, category: categories.sample)
  good_review = FactoryGirl.create(:review, rating: 5, body: "It's awesome!")
  add_comments(good_review)
  bad_review = FactoryGirl.create(:review, rating: 1, body: "It's the worst!")
  add_comments(bad_review)
end

def add_comments(review)
  FactoryGirl.create(
    :comment,
    review: review,
    body: "Are you kidding me, you idiot!"
  )
  FactoryGirl.create(
    :comment,
    review: review,
    body: "Don't listen to that guy, you are dead on. He's the idiot"
  )
end
