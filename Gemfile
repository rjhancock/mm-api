# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '~> 2.7.0'

gem 'rails', '~> 6.0.0'

gem 'airbrake'
gem 'bootsnap'
gem 'devise'
gem 'hiredis'
gem 'jbuilder'
gem 'kaminari'
gem 'pg'
gem 'puma'
gem 'rack-cors', require: 'rack/cors'
gem 'sassc'
gem 'sidekiq'
gem 'webpacker'
gem 'whenever'

group :development, :test do
  gem 'capybara'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
end

group :development do
  gem 'annotate'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end
