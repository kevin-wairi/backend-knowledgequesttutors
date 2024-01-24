class AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    user = User.find_by(username: params[:username])
    
      if user&.authenticate(params[:password])
        token = encode_token({ user_id: user.id })
        # Set CORS headers
        cors_set_access_control_headers
        render json: { user: UserSerializer.new(user), jwt: token }, status: :accepted
      else
        render json: [error: "Invalid username or password"],status: :unauthorized
      end
      
  end
  
end