require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :tool do
    sequence(:name) { |n| "DevTool#{n}" }
    sequence(:description) { |n| "It does #{n} thing(s)" }
    category
    user
  end

  factory :review do
    sequence(:rating) { rand(1..5) }
    body "So good!"
    user
    tool
  end

  factory :category do
    name "Language"
  end
end
