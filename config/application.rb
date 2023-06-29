require_relative "boot"
require "rails/all"
require "sprockets/railtie"

Bundler.require(*Rails.groups)
Dotenv::Railtie.load if %w[development test].include? ENV["RAILS_ENV"]

module EcommerceApi
  class Application < Rails::Application
    config.load_defaults 7.0
    # config.eager_load_paths << Rails.root.join("extras")

    config.api_only = true
    config.middleware.use Rack::MethodOverride
    config.middleware.use ActionDispatch::Flash
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore
  end
end
