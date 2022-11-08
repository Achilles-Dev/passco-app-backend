class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :subject

  validates :value, presence: true
  validates :year, presence: true
end
