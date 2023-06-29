source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"
gem "bootsnap", require: false
gem "dotenv-rails"
gem "graphql"
gem "hirb"
gem "hirb-unicode-steakknife", require: "hirb-unicode"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.5"

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails"
  gem "rubocop", require: false
  gem "shoulda-matchers"
end

group :development do
  gem "annotate"
  gem "solargraph"
end
