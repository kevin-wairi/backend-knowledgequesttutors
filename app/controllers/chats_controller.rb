class ChatsController < ApplicationController

  def create
    chat = Chat.new(chat_params)
    chat.save!
    render json: chat, status: :created
  rescue ActiveRecord::RecordInvalid => e
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
    params.permit(:user_1_id,:user_2_id)
  end
end