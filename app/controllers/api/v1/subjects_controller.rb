class Api::V1::SubjectsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    subjects = Subject.all
    render json: subjects, status: :ok
  end

  def new
    @subject = Subject.new
  end

  def create
    subject = Subject.new(subject_params)
    if subject.save!
      render json: subject, status: :ok
    else
      render json: { errors: 'Subject could not be saved' }, status: :unprocessable_entity
    end
  end

  def show
    subject = Subject.find(params[:id])
    if subject.present?
      render json: subject, status: :ok
    else
      render json: { error: 'Subject does not exist' }, status: :not_found
    end
  end

  def update
    subject = Subject.find(params[:id])
    if subject.present?
      subject.update(subject_params)
      render json: { success: 'Subject successfully updated' }
    else
      render json: { error: 'Subject does not exist' }, status: :not_found
    end
  end

  def destroy
    subject = Subject.find(params[:id])
    if subject.present?
      subject.destroy
      render json: { success: 'Subject successfully deleted' }
    else
      render json: { error: 'Subject does not exist' }, status: :not_found
    end
  end

  private

  def subject_params
    params.require('subjects').permit(:name, :code)
  end
end
