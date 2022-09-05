class User < ApplicationRecord
  has_many :user_data

  validates :username, presence: true
end
