source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"
gem "activeadmin", github: "activeadmin/activeadmin", branch: "master"
gem "arctic_admin"
gem "awesome_rails_console"
gem "bcrypt", "~> 3.1.12"
gem "bootsnap", require: false
gem "devise"
gem "dotenv-rails"
gem "email_address"
gem "graphql"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rack-cors"
gem "rails", "~> 7.0.5"
gem "sass-rails"
gem "sprockets", "<4"

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "faker", "~> 3.2"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails"
  gem "rubocop", require: false
  gem "rubocop-rails"
  gem "shoulda-matchers"
end

group :development do
  gem "annotate"
  gem "solargraph"
end
