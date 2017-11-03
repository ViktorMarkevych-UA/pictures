source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '5.1.4'
gem 'pg'
gem 'haml'
gem 'devise'
gem 'will_paginate'
gem 'paperclip'
gem 'therubyracer'
gem 'haml-rails'
gem 'listen'
gem 'puma', '~> 3.7'
# gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'jquery-rails'

group :development, :test do
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :test do
  gem 'factory_girl_rails'
  gem 'simplecov', require: false
  gem 'database_cleaner'
  gem 'shoulda-matchers', require: false
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen'#, '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]