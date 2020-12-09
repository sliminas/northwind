# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.2"

gem "rails", "~> 6.0.3", ">= 6.0.3.4"

gem "activerecord-import"
gem "pg", ">= 0.18", "< 2.0"

gem "cells-rails"
gem "cells-slim"
gem "slim"
gem "trailblazer-cells"

gem "puma", "~> 4.1"
gem "sass-rails", ">= 6"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 4.0"

gem "bootsnap", ">= 1.4.2", require: false
gem "jbuilder", "~> 2.7"

group :development, :test do
  gem "awesome_print"
  gem "factory_bot_rails"
  gem "faker"
  gem "pry-byebug"
  gem "rspec-rails"
end

group :development do
  gem "listen", "~> 3.2"
  gem "rubocop"
  gem "rubocop-performance"
  gem "rubocop-rails"
  gem "rubocop-rspec"
  gem "rubocop-thread_safety"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webdrivers"
end
