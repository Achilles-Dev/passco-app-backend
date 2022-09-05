class UserDatum < ApplicationRecord
  belongs_to :user

  validates :validate_data

  private

  def validate_data
    errors.add(:options, :invalid) unless options.is_a?(Array)
  end
end
