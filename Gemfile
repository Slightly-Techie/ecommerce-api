source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'
gem 'bootsnap', require: false
gem 'dotenv-rails'
gem 'graphql'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.5'
gem 'rack-cors'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]


group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "shoulda-matchers"
  gem "pry-byebug"
end

group :development do
  gem "annotate"
end
