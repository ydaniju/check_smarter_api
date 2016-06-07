# frozen_string_literal: true
source "https://rubygems.org"

gem "rails", ">= 5.0.0.beta3", "< 5.1"
gem "pg"
gem "puma"
gem "rubocop"
gem "coveralls", require: false
gem "jbuilder", "~> 2.0"
gem "devise"
gem "jwt", "~> 1.5", ">= 1.5.4"
gem "rack-cors"
gem "simple_command"

group :development, :test do
  gem "pry"
  gem "factory_girl_rails"
  gem "faker"
end

group :test do
  gem "shoulda", "~> 3.5"
  gem "shoulda-matchers", "~> 2.0"
end

group :development do
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
