require 'factory_girl'

FactoryGirl.define do
  factory :category do
    name "Language"
  end

  factory :comment do
    body "I agree!"
    review
    user
  end

  factory :review do
    rating 4
    body "So good!"
    user
    tool
  end

  factory :tool do
    sequence(:name) { |n| "DevTool#{n}" }
    sequence(:description) { |n| "It does #{n} thing(s)" }
    category
    user
  end

  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end
end
