class Api::V1::AnswersController < ApplicationController
  before_action :authenticate_user!, :set_question, :set_subject, only: %i[index create]

  def index
    answers = Answer.find_by(params[:answers][:year], subject: @subject)
    render json: answers, status: :ok
  end

  def new
    @answer = Answer.new
  end

  def create
    answer = Answer.new(answer_params).merge(question: @question, subject: @subject)
    if answer.save!
      render json: answer, status: :ok
    else
      render json: { errors: 'Answer could not be saved' }, status: :unprocessable_entity
    end
  end

  def show
    answer = Answer.find(params[:id])
    if answer.present?
      render json: answer, status: :ok
    else
      render json: { error: 'Answer does not exist' }, status: :not_found
    end
  end

  def update
    answer = Answer.find(params[:id])
    if answer.present?
      answer.update(answer_params)
      render json: { success: 'Answer successfully updated' }
    else
      render json: { error: 'Answer does not exist' }, status: :not_found
    end
  end

  def destroy
    answer = Answer.find(params[:id])
    if answer.present?
      answer.destroy
      render json: { success: 'Answer successfully deleted' }
    else
      render json: { error: 'Answer does not exist' }, status: :not_found
    end
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_subject
    @subject = Subject.find(params[:subject_id])
  end

  def answer_params
    params.require('answers').permit(:value, :year)
  end
end
