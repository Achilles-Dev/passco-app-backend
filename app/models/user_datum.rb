class UserDatum < ApplicationRecord
  belongs_to :user

  validates :subject, presence: true
  validates :score, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: BigDecimal(101) }
end
