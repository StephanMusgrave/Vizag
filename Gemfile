source 'https://rubygems.org'
ruby "2.2.1"

gem 'rails', '4.2.1'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jquery-turbolinks', '~> 2.1.0'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'bootstrap-sass', '~> 3.3.4.1'
gem "paperclip", "~> 4.3"
gem "paperclip-dropbox", ">= 1.3.2"
gem "figaro", ">= 1.1.1"
gem "devise", ">= 3.5.2"
gem 'activeadmin', '~> 1.0.0.pre1'


group :test do
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'poltergeist'
  gem 'faker'
  gem 'launchy'
  gem 'capybara-email'
  gem 'cucumber-rails', require: false
  gem "selenium-webdriver", "2.46.2"
end

group :development, :test do
  gem 'sqlite3'
  gem 'byebug'
  gem 'web-console',           '~> 2.0'
  gem 'spring'
  gem 'spring-commands-rspec', '1.0.4'
  gem 'factory_girl_rails'
  gem 'quiet_assets', '1.1.0' # from now on each gem should be given a version
  gem 'jasmine', '2.3.0'
  gem 'dotenv-rails'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

