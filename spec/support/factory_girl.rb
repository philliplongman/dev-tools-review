require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :tool do
    sequence(:category_id) { |n| n }
    sequence(:user_id) { |n| n }
    sequence(:name) { |n| "DevTool#{n}" }
    sequence(:description) { |n| "It does #{n} thing(s)" }
    user
  end

  factory :review do
    sequence(:rating) { rand(1..5) }
    association :user, factory: :user
    association :tool, factory: :tool
  end
end
