class Question < ApplicationRecord
  belongs_to :subject

  validates :year, presence: true, inclusion: { in: 1900..Date.today.year },
                   format: {
                     with: /(19|20)\d{2}/i,
                     message: 'should be a four-digit year'
                   }
  validates :question_no, presence: true,
                          numericality: { greater_than_or_equal_to: 1, less_than: BigDecimal(101) }
  validates :content, presence: true
  validates :validate_option

  private

  def validate_option
    errors.add(:options, :invalid) unless options.is_a?(Array)
  end
end
