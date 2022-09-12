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
end
