class Api::V1::RegistrationsController < Devise::RegistrationsController
  def create
    user = User.new(sign_up_params)

    if user.save!
      token = user.generate_jwt
      access_token = AccessToken.new(token:, user:)
      if access_token.save!
        render json: {
          user:,
          token:
        }, status: :ok
      else
        user.destroy
        render json: { errors: 'User could not be registered' }, status: :unprocessable_entity
      end
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  def sign_up_params
    params.require('user').permit(:username, :email, :password)
  end
end
