class QuestionsController < ApplicationController
    skip_before_action :authorized, only: [:create,:show,:index,:destroy]

    def create
        user = User.find(params[:user_id]) 
        question = user.questions.create!(question_params)
        render json: question,user:UserSerializer,status: :ok
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
        params.permit(:user_id,:subject,:title,:details,:school,:course,:pageCount,:deliverytime,:budget,:academicLevel)
    end
end
