class QuestionsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    skip_before_action :authorized, only: [:create,:show,:index,:destroy]

    def create
        user = User.find(params[:user_id]) 
        question = user.questions.create!(question_params)
        render json: question,user:UserSerializer,status: :ok
    rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

    def index
        questions = Question.all
        render json: questions,status: :ok
    end

    def show
        question = Question.where(user_id: params[:id])
        render json: question ,status: :ok
    end

private

    def question_params
        params.permit(:user_id,:topic,:subject,:details,:school,:pageCount,:deliverytime,:budget,:academicLevel)
    end
    def render_not_found_response
        render json: {error: "User not found"}, status: 404
      end
end
