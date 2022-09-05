class Answer < ApplicationRecord
  belongs_to :question

  validates :answer_no, presence: true,
                        numericality: { greater_than_or_equal_to: 1, less_than: BigDecimal(101) }
  validates :value, presence: true
end
