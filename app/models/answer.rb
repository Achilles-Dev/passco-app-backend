class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :subject

  validates :answer_no, presence: true,
                        numericality: { greater_than_or_equal_to: 1, less_than: BigDecimal(101) }
  validates :value, presence: true
  validates :year, presence: true,
                   numericality: { greater_than_or_equal_to: 1900, less_than_or_equal_to: Date.today.year }
end
