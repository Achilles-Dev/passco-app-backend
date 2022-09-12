class Question < ApplicationRecord
  belongs_to :subject

  validates :year,presence: true, 
            numericality: { greater_than_or_equal_to: 1900, less_than_or_equal_to: Date.today.year }
  validates :question_no, presence: true,
                          numericality: { greater_than_or_equal_to: 1, less_than: BigDecimal(101) }
  validates :content, presence: true
  validates :options, presence: true
end
