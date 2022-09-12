class Api::V1::RegistrationsController < Devise::RegistrationsController
  def create
    user = User.new(sign_up_params)

    if user.save!
      token = user.generate_jwt
      render json: {
        token: token.to_json,
        user: user
      }
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  def sign_up_params
    params.permit(:username, :email, :password)
  end
end
