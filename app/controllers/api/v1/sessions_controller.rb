class Api::V1::SessionsController < Devise::SessionsController
  def create
    @user = User.find_by_email(sign_in_params[:email])

    if @user&.valid_password?(sign_in_params[:password])
      access_token = AccessToken.find_by(user_id: @user.id)
      @token = access_token.token
      render json: {
        user: @user, token: @token
      }, status: :ok
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  def sign_in_params
    params.require('user').permit(:email, :password)
  end
end
