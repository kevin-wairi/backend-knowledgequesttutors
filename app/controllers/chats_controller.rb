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
        render json: chats,status: :ok
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
