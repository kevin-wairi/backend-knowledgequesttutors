class ActivityController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  skip_before_action :authorized, only: [:create,:show,:index,:destroy]

  def index
    activities = Activity.all
    render json:activities, status: :ok
  end

  def create
    user = User.find(params[:user_id])
    activity = user.activities.create!(activity_params)
    render json:activity, status: :created
  end

  def show
    activities = Activity.where(user_id: params[:user_id])
    render json:activities,status: :ok
  end

  def destroy
    activities = Activity.where(user_id: params[:user_id])
    activities.destroy_all
    render json: {}, status: 204
  end


  private
  def activity_params
    params.permit(:user_id,:activity_type,:details,:status,:activity_id)
  end

  def render_not_found_response
    render json: {error: "Record not found"}, status: 404
  end
end
