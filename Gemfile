# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '~> 2.6.3'

gem 'rails', '~> 6.0.0'

gem 'bootsnap'
gem 'hiredis'
gem 'jbuilder'
gem 'pg'
gem 'puma'
gem 'rack-cors', require: 'rack/cors'
gem 'sassc'
gem 'sidekiq'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem "webpacker"
gem 'whenever'

# Scraping of Mech Factory
gem 'capybara'
gem 'webdrivers'
gem 'selenium-webdriver'

group :development, :test do
  gem 'rspec-rails'
  gem 'simplecov', require: false
end

group :development do
  gem 'annotate'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
