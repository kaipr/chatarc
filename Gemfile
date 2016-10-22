source "https://rubygems.org"
ruby "2.3.1"

gem "rails", "~> 5.0.0"
gem "pg"

gem "slim"
gem "sass-rails", "~> 5.0"
# gem "uglifier"
gem "jquery-rails"

gem "puma"

group :development do
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
end

group :development, :test do
  gem "dotenv-rails"

  gem "pry-byebug"
  gem "pry-rails"

  gem "rspec-rails", "~> 3.5"
  gem "factory_girl_rails"
end

group :test do
  gem "capybara-webkit"
  gem "database_cleaner"
  gem "formulaic"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
