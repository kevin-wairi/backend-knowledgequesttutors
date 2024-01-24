require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BackendKnowledgequesttutors
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    
    config.api_only = true

     # Configuring CORS to allow requests from a specific origin
     config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'https://frontend-knowedgequest.onrender.com' # Replace with your frontend's actual origin
        resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
      end
    end

    # configured rails to use cookies -KK
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore

      # config to protect cookies for same domain request only -KK
    config.action_dispatch.cookies_same_site_protection = :strict


  end
end
