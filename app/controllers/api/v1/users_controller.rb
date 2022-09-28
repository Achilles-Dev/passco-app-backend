class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    users = User.all
    render json: users, status: :ok
  end

  def show
    user = User.find(params[:id])
    if user.present?
      render json: user, status: :ok
    else
      render json: { error: 'User does not exist' }, status: :not_found
    end
  end

  def update
    user = User.find(params[:id])
    if user.present?
      user.update(user_params)
      render json: { success: 'User successfully updated' }
    else
      render json: { error: 'User does not exist' }, status: :not_found
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.present?
      user.destroy
      render json: { success: 'User successfully deleted' }
    else
      render json: { error: 'User does not exist' }, status: :not_found
    end
  end

  def user_params
    params.require('user').permit(:username, :email, :password)
  end
end
