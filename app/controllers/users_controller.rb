    class UsersController < ApplicationController
        rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
        rescue_from ActiveRecord::RecordInvalid, with: :render_validation_error
        skip_before_action :authorized, only: [:create,:show,:index,:destroy,:update]
        
        def index
            users = User.all
            render json: users,status: :ok
        end

        def show
            puts " username  #{params[:id]}"
            user = User.find(params[:id])
            render json: user,status: :ok
        end


        def create
            user = User.find_by(username: params[:username]) || User.find_by(email: params[:email])
            if user
            render json: {error:'user already exists'},status: 400
            else
                if params[:isAdmin].nil?
                    params[:isAdmin] = false
                end
                user = User.create!(user_params)
                user.img.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'profile.jpg')), filename: 'profile.jpg', content_type: 'image/jpg')
                token = encode_token(user_id: user.id)
                Activity.create(user_id: user.id, action_type: 'user_create', resource_id: user.id)
                render json: { user: UserSerializer.new(user), jwt: token }, status: :created
            end
        rescue ActiveRecord::RecordInvalid => e
            render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
        end

        def update
            user = User.find(params[:id])
            if params[:img]
                user.update(user_params)
             else
                user.update(user_params.except(:img))
            end
            Activity.create(user_id: user.id, action_type: 'user_update', resource_id: user.id)
            render json: user,status: :ok
        end

        def destroy
            user = user_find
            user.destroy
            render json: {} , status: 204
        end

        private

        def user_params
            params.permit(:username, :school,:course, :email,:phoneNumber, :password,:password_confirmation,:img)
        end
        def user_find
            User.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            render json: { error: 'User not found' }, status: :not_found
        end
        def render_not_found_response
            render json: {error: "user not found"}, status: 404
          end
          def render_validation_error
            render json: {error: "user validation error"}, status: 400
        end
        
    end