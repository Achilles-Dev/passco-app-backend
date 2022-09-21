class SubjectUserDatum < ApplicationRecord
  belongs_to :subject
  belongs_to :user_datum
end
