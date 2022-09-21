class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_data, dependent: :destroy

  validates :username, presence: true

  def generate_jwt
    JWT.encode({ id:, exp: 60.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
  end
end
