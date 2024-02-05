class CommentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  skip_before_action :authorized, only: [:create,:index,:destroy]
  
  def create
    comment = Comment.create(comment_params)
    Activity.create(user_id: current_user.id, action_type: 'create_comment', resource_id: comment.id)
    render json: comment,status: :created
  end

  def index
    comments = Comment.all
    render json: comments,status: :ok
  end

  def show
    comment = Comment.find_by(id: params[:user_id])
    render json: comment, status: :ok
  end

  def destroy

  end

  private

  def comment_params
    params.permit(:user_id,:content,:email,:username,:user_img)
  end
  def render_not_found_response
    render json: {error: "comments not found"}, status: 404
  end

end
