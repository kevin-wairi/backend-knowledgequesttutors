class QuestionsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    skip_before_action :authorized, only: [:create,:show,:index,:destroy]

    def create
        puts" CREEEEEEEEEEEEEATE #{question_params}"
        user = User.find(params[:user_id])
        puts" #{user.username}"
        if user
            if params[:files]
            question = user.questions.create!(question_params)
            else
                question = user.questions.create!(question_params.except(:files))
            end
            render json: question, status: :ok
          else
            render json: { error: 'User not found' }, status: 404
          end
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

    def destroy
        question = Question.find(id: params[:id])
      
        if question
          question.delete
          render json: {}, status: :ok
        else
          render json: { error: 'Question not found' }, status: 404
        end
    end

private

    def question_params
        params.permit(:topic,:pageCount,:deliverytime,:budget,:academicLevel,:subject,:details,:user_id,files: [])
    end
    def render_not_found_response
        render json: {error: "User not found"}, status: 404
      end
end

