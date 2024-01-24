# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors
# config/initializers/cors.rb

  
Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
        origins "https://frontend-knowedgequest.onrender.com"
              /\Ahttp:\/\/192\.168\.0\.\d{1,3}(:\d+)?\z/
              # regular expressions can be used here
  
      resource '/file/list_all/', :headers => 'x-domain-token'
      resource '/file/at/*',
          methods: [:get, :post, :delete, :put, :patch, :options, :head],
          headers: 'x-domain-token',
          expose: ['Some-Custom-Response-Header'],
          max_age: 720
          # headers to expose
    end
  
    allow do
        origins "https://frontend-knowedgequest.onrender.com"
      resource '/public/*', headers: :any, methods: :get
  
      # Only allow a request for a specific host
      resource '/api/v1/*',
          headers: :any,
          methods: :get,
          if: proc { |env| env['HTTP_HOST'] == 'https://frontend-knowedgequest.onrender.com' }
    end
  end