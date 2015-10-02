source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.2.4'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'rspec-rails', group: [:development, :test]
gem 'capybara', group: [:development, :test]
gem 'launchy', group: [:development, :test]
gem 'factory_girl', group: [:development, :test]
gem 'valid_attribute', group: [:development, :test]
gem 'shoulda-matchers', group: [:development, :test], require: false
gem 'devise'
gem 'foundation-rails'
gem 'kaminari'
gem 'font-awesome-sass'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'database_cleaner'
  gem 'pry'
  gem 'faker'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'coveralls', require: false
  gem 'poltergeist'
end

group :production do
  gem 'rails_12factor'
end
