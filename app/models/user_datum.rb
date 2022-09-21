class UserDatum < ApplicationRecord
  belongs_to :user
  has_many :subject_user_data, dependent: :destroy
  has_many :subjects, through: :subject_user_data, dependent: :destroy

  validates :score, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: BigDecimal(101) }
end
