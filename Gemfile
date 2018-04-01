# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# waf
gem 'rails', '~> 5.1.6'

# db
gem 'mysql2', '>= 0.3.18', '< 0.6.0'

# web server
gem 'puma', '~> 3.7'

# view
gem 'active_decorator'
gem 'slim-rails'
# css
gem 'sass-rails', '~> 5.0'
# js
gem 'coffee-rails'
gem 'uglifier', '>= 1.3.0'
# frontend
gem 'webpacker'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # linter
  gem 'dm_linters'
  gem 'rubocop'

  # deploy
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-nginx'
  gem 'capistrano3-puma'
end
