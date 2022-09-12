class Api::V1::UserDataController < ApplicationController
  before_action :authenticate_user!, :set_user, only: [:create]

  def index
    user_data = UserDatum.all
    render json: user_data, status: :ok
  end

  def new
    @user_datum = UserDatum.new
  end

  def create
    user_datum = UserDatum.new(user_datum_params).merge(user: @user)
    if user_datum.save!
      render json: user_datum, status: :ok
    else
      render json: { errors: 'User Data could not be saved' }, status: :unprocessable_entity
    end
  end

  def show
    user_datum = UserDatum.find(params[:id])
    if user_datum.present?
      render josn: user_datum, status: :ok
    else
      render json: { errors: 'User Data does not exist' }, status: :not_found
    end
  end

  def destroy
    user_datum = UserDatum.find(params[:id])
    if user_datum.present?
      user_datum.destroy
      render json: { success: 'User Data successfully deleted' }
    else
      render json: { error: 'User Data does not exist' }, status: :not_found
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def user_datum_params
    params.require('user_data').permit(:subject, :score)
  end
end
