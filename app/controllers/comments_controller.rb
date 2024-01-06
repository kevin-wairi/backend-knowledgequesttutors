class CommentsController < ApplicationController
  def create
    comment = Comment.crate!(comment_params)
    render json: comment,status: :ok
  end

  def index
  end

  def show
  end

  def destroy
  end
end
