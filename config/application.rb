require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)
Dotenv::Rails.load if %w[development test].include? ENV['RAILS_ENV']

module EcommerceApi
  class Application < Rails::Application
    config.load_defaults 7.1

    config.autoload_lib(ignore: %w[assets tasks])
    config.api_only = true
  end
end
