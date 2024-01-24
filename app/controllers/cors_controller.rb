class CorsController < ApplicationController
    skip_before_action :authorized

    def cors_preflight_check
        if request.method == 'OPTIONS'
            self.class.cors_set_access_control_headers(response.headers)
            head :ok
            puts "OKKKKKKKKKKKKKRRRRRRRRR"
        end
    end

    protected

    def self.cors_set_access_control_headers(headers)
        response.headers['Access-Control-Allow-Origin'] = "https://frontend-knowedgequest.onrender.com"

        response.headers['Access-Control-Allow-Credentials'] = "true"
        response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
        response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token, Auth-Token, Email, X-User-Token, X-User-Email'
        response.headers['Access-Control-Max-Age'] = "7200"
    end

end
