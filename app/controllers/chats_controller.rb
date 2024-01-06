    class ChatsController < ApplicationController
        skip_before_action :authorized, only: [:show,:index,:destroy]

        def create
            chat = Chat.create!(chat_params)
            render json: chat,status: :created
            rescue   ActiveRecord::RecordInvalid => e
            render json: { error: chat.errors.full_messages }, status: :unprocessable_entity
        end

        def index
            chats = Chat.all
        
            chat_data = chats.map do |chat|

              sender_id = chat.sender_id
              receiver_id = chat.receiver_id
            

              sender = User.find_by(id: sender_id)
              receiver = User.find_by(id: receiver_id)
        
              {
                chats: chat,
                sender_username: sender&.username,
                sender_image: sender&.img,
                receiver_username: receiver&.username,
                receiver_image: receiver&.img,
                receiver_id: receiver&.id,
                messages: chat.messages 
              }
            end 
        
            render json: { chat_data: chat_data }, status: :ok
          end
          
        def show
                chat = Chat.find_by(id: params[:id])
                render json: chat,status: :ok
        end

        private
        def chat_params
            params.permit(:sender_id,:receiver_id)
        end
    end
