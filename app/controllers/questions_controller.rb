class QuestionsController < ApplicationController
  before_action :set_subject, only: %i[index create]

  def index
    questions = Question.where(year: params[:year], subject: @subject)
    render json: questions
  end

  def new
    @question = Question.new
  end

  def create
    question = Question.new(question_params.merge(subject: @subject))
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

  def set_subject
    @subject = Subject.find(params[:subject_id])
  end

  def question_params
    params.require('questions').permit(:year, :question_no, :content, :options)
  end
end
