class ReviewsController < ApplicationController
  skip_before_action :authorized, only: [:index]
  before_action :set_review, only: %i[ show update destroy ]

  # GET /reviews
  def index
    reviews = Review.all
    render json: reviews
  end

  # GET /reviews/1
  def show
    render json: @review
  end
  def destroy
    review = Review.find(params[:id])
    review.delete
    render head: []
  end

  def update
    puts "RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR #{review_params}"
    review = Review.find(params[:id])
    puts "RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR #{review}"
    review.update(review_params)
    render json: review
  end

  # POST /reviews
  def create
    user = User.find(params[:user_id])
    if params[:approved].nil?
      params[:approved] = false
    end
    review = user.reviews.create!(review_params)
      render json: {message: 'Reviews was created succesfully'}, status: :created
      Activity.create(user_id: params[:user_id], action_type: 'review_sent', resource_id: review.id)
    rescue ActiveRecord::RecordInvalid => e
      render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.permit(:id,:review,:user_id,:rating,:approved)
    end
end
