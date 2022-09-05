class Subject < ApplicationRecord
  has_many :questions

  validates :name, presence: true
  validates :code, presence: true, numericality: { greater_than_or_equal_to: 100, less_than: BigDecimal(1000) }
end
