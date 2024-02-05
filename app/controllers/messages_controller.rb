class MessagesController < ApplicationController
    skip_before_action :authorized, only: [:create,:index,:destroy,:show,:update]
    # before_action :authorized, except: [:public_action1, :public_action2]
    # before_action :authorized

def create
    
    sender = User.find_by(id: params[:user_id])
    receiver = User.find_by(id: params[:receiver_id])

    chat = Chat.find_by(sender_id: sender.id, receiver_id: receiver.id)

    unless chat
      chat = Chat.find_by(sender_id: receiver.id, receiver_id: sender.id)
      chat ||= Chat.create!(sender_id: sender.id, receiver_id: receiver.id)
    end


    message = chat.messages.create!(message_params)
    Activity.create(user_id: current_user.id, action_type: 'send_message', resource_id: message.id)
    render json:{ message: message,receiver_username: receiver.username,receiver_image: receiver.img} ,status: :created
rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
end


def index
    messages = Message.all 
    render json: messages,status: :ok
end

def show
    messages = Message.find_by(id: params[:id])
    render json: messages,status: :ok
end

def update  
    message = Message.find_by(id: [params_id])
    render json: messages,status: :ok
end

private

    def message_params
        params.permit(:user_id,:receiver_id,:chat_id,:content,:read_status,:delivery_status,:user_img)
    end
end









# class MessagesController < ApplicationController
#     skip_before_action :authorized, only: [:create,:index,:destroy]
    
# def create
#     before_action :set_chat
    
#     puts "---------------------------------------------------------"
#     user = User.find(params[:sender_id])
#     puts "---------------------------------------------------------"

#     chat = Chat.find_or_create_by!(sender_id: params[:sender_id], receiver_id: user.id)

#     message = user.messages.create(message_params.merge(chat_id: chat.id))
#     render json: message,status: :created
# rescue ActiveRecord::RecordInvalid => e
#     render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
# end

# def index
#     messages = Message.all 
#     render json: messages,status: :ok
# end

# def show
#     messages = Message.find_by(id: params[:id])
#     render json: messages,status: :ok
# end

# def update  
#     message = Message.find_by(id: [params_id])

# end
# private
# def set_chat
#     chat = Chat.find(params[:chat_id])
#   end

#     def message_params
#         params.permit(:receiver,:content,:read_status,:delivery_status)
#     end
# end