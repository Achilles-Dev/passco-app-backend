class Subject < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :subject_user_data, dependent: :destroy
  has_many :user_data, through: :subject_user_data, dependent: :destroy

  validates :name, presence: true
  validates :code, presence: true, numericality: { greater_than_or_equal_to: 100, less_than: BigDecimal(1000) }
end
