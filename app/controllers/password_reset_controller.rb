class PasswordResetController < ApplicationController
  skip_before_action :authorized, only: [:create,:show,:index,:destroy,:update]
  def create
    email = params[:email]
    user = User.find_by(email: params[:email]&.downcase)
    puts "USER: #{user}"
    puts "EMAIL: #{email}"

      if user.present?
        user.create_reset_digest
      # Send reset instructions via email or SMS here
      # UserMailer.password_reset(user).deliver_now
        
      render json: {
        message: "If this user exists, we have sent you a password reset email.",
      }
    else
      render json: {
        message: "If this user exists, we have sent you a password reset E-mail.",
      }
    end
      rescue ActiveRecord::RecordInvalid => e
        render json: { message: "If this user exists, we have sent you a password reset EMAIL." }, status: :unprocessable_entity
  end

  # def edit
  # end

  def update
    user = User.find_by(reset_digest: params[:token])
    
    if user.present? && user.password_reset_token_valid?(params[:token])
      # puts " "
      # puts "FOUND USER: #{params[:token]}"
      # puts " "
      if user.reset_password(params[:password])
        render json: {
          message: "Your password has been successfuly reset!"
        }
        session[:user_id] = user.id
      else
        render json: { error: user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {error:  ['Link not valid or expired. Try generating a new link.']}, status: :not_found
    end
  end

end
