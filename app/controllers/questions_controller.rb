class QuestionsController < ApplicationController
    
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    skip_before_action :authorized, only: [:create,:show,:index,:destroy]

    def create
        user = User.find(params[:user_id])
        if user
            if params[:files]
            question = user.questions.create!(question_params)
            else
                question = user.questions.create!(question_params.except(:files))
            end
            Activity.create(user_id: user.id, action_type: 'add_question', resource_id: question.id)
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
        question = Question.find_by(id: params[:id])
        puts"CCONT'"
        if question
            puts" CURRENT #{current_user.id}"
          question.delete
          Activity.create(user_id: current_user.id, action_type: 'deleted_question', resource_id: question.id)
          render head: {}, status: :ok
        else
          render json: { error: 'Question not found' }, status: 404
        end
    end

private

    def question_params
        params.permit(:topic,:pageCount,:deliverytime,:budget,:academicLevel,:subject,:details,:user_id,files: [])
    end
    def render_not_found_response
        render json: {error: "record not found"}, status: 404
      end
end

