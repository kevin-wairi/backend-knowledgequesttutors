    class UsersController < ApplicationController
        rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
        skip_before_action :authorized, only: [:create,:show,:index,:destroy,:update]
        
        

        def show
            user = User.find_by(id: params[:id])
            render json: user,status: :ok
        end

        def index
            users = User.all
            render json: users
        end

        def create
            user = User.create!(user_params)
            token = encode_token(user_id: user.id)
            render json: { user: UserSerializer.new(user), jwt: token }, status: :created
        rescue ActiveRecord::RecordInvalid => e
            render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
        end

        def update
            user = User.find_by(id: params[:id])
            user.update(user_params)
            render json: user,status: :ok
        end

        def destroy
            user = user_find
            user.destroy
            render json: {} , status: 204
        end

        private

        def user_params
            params.permit(:username, :school,:course, :email,:phoneNumber, :password, :password_confirmation,:img,:isAdmin)
        end
        def user_find
            User.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            render json: { error: 'User not found' }, status: :not_found
        end
        def render_not_found_response
            render json: {error: "user not found"}, status: 404
          end
        
    end
