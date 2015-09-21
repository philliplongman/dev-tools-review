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
  end

end
