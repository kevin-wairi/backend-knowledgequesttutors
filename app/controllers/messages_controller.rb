class MessagesController < ApplicationController
    skip_before_action :authorized, only: [:create,:index,:destroy]
    
def create
    
    puts "---------------------------------------------------------"
    user = User.find(params[:sender_id])
    puts "---------------------------------------------------------"

    chat = Chat.find_or_create_by!(sender_id: params[:sender_id], receiver_id: user.id)

    message = user.messages.create(message_params.merge(chat_id: chat.id))
    render json: message,status: :created
rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
end

def index
    messages = Message.all 
    render json: messages,status: :ok
end

def update  
    message = Message.find_by(id: [params_id])

end
private

    def message_params
        params.permit(:receiver,:content,:read_status,:delivery_status)
    end
end