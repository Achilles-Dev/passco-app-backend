class QuestionsController < ApplicationController
  def index
    questions = Question.find_by(year: params[:year], subject_id: params[:subject_id])
    render json: questions
  end

  def new
    @question = Question.new
  end

  def create
    question = Question.new(question_params)
    if question.save!
      render json: question, status: :ok
    else
      render json: { errors: 'Question could not be saved' }, status: :unprocessable_entity
    end
  end

  def show
    question = Question.find(params[:id])
    if question.present?
      render json: question, status: :ok
    else
      render json: { error: 'Question does not exist' }, status: :not_found
    end
  end

  def update
    question = Question.find(params[:id])
    if question.present?
      question.update(question_params)
      render json: { success: 'Question successfully updated' }
    else
      render json: { error: 'Question does not exist' }, status: :not_found
    end
  end

  def destroy
    question = Question.find(params[:id])
    if question.present?
      question.destroy
      render json: { success: 'Question successfully deleted' }
    else
      render json: { error: 'Question does not exist' }, status: :not_found
    end
  end

  private

  def question_params
    params.require('questions').permit(:subject_id, :year, :question_no, :content, :options)
  end
end
