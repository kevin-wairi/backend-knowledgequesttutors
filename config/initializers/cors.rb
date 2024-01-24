# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors
# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins "https://frontend-knowedgequest.onrender.com"
  
      resource "*",
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        credentials: true  # Allow credentials (cookies) in the request
    end
  
    # Add a separate block to handle errors for disallowed origins
    allow do
      origins "example.com"  # Add your allowed origins here
  
      resource "*",
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        credentials: true  # Allow credentials (cookies) in the request
  
      # Handling CORS error for disallowed origin
      # You can customize the response based on your requirements
      if ENV['RAILS_ENV'] == 'production'
        # In production, you might want to return a more generic error message
        run lambda { |_env| [403, { 'Content-Type' => 'application/json' }, [{ error: 'CORS not allowed' }.to_json]] }
      else
        # In development, you can provide more detailed error information
        run lambda { |_env| [403, { 'Content-Type' => 'application/json' }, [{ error: 'CORS not allowed from this origin' }.to_json]] }
      end
    end
  end
  