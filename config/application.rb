require_relative 'boot'
require 'net/http'
require 'uri'
require "rails"
require "byebug"

# require 'byebug'
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "rails/test_unit/railtie"
require "sprockets/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TakeoutTaxi
  class Application < Rails::Application
    
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.active_support.cache_format_version = 7.0
    Bundler.require(*Rails.groups)

    # Dotenv::Railtie.load

      HOSTNAME = ENV['HOSTNAME']
 
    config.to_prepare do
      DeviseController.respond_to :html, :json
    end
    # config.action_dispatch.default_headers = {
    #   'Access-Control-Allow-Origin' => 'http://localhost:3001.com',
    #   'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(","),

    # }


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
    # , debug: true, logger: (-> { Rails.logger }) do
    config.middleware.insert_before 0, Rack::Cors do
    allow do
        origins "http://localhost:3001"
        #  "https://www.takeouttruckstop.com"
           # your client's domain https://takeouttruckstop.herokuapp.com
        resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head], 
        credentials: true
      end
    end
  end
end
