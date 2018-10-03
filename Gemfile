# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '~> 2.3.4'

gem 'rails', '~> 5.2.0'

gem 'bootsnap'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'hiredis'
gem 'jbuilder', '~> 2.5'
gem 'kaminari'
gem 'pg', '~> 1.0'
gem 'puma', '~> 3.7'
gem 'rack-cors', require: 'rack/cors'
gem 'sass', '~> 3.5'
gem 'sidekiq'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'whenever'

group :development, :test do
  gem 'capybara', '~> 2.13'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
end

group :development do
  gem 'annotate'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
