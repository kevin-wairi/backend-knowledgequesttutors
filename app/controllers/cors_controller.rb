class CorsController < ApplicationController
    skip_before_action :authorized
    
    def cors_preflight_check
        if request.method == 'OPTIONS'
            cors_set_access_control_headers
            render  text: '', content_type: 'text/plain'
            puts "OKKKKKKKKKKKKKRRRRRRRRR"
        end
    end

    protected

    def cors_set_access_control_headers
        response.headers['Access-Control-Allow-Origin'] = "https://frontend-knowedgequest.onrender.com"

        response.headers['Access-Control-Allow-Credentials'] = "true"
        response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
        response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token, Auth-Token, Email, X-User-Token, X-User-Email'
        response.headers['Access-Control-Max-Age'] = "86400"
    end

end
