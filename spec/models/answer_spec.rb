require 'rails_helper'

RSpec.describe Answer, type: :model do
  subject = Subject.create!(name: 'English Language', code: 302)
  question = Question.create!(year: 2022, question_no: 1, content: 'This is the first question.',
                              options: %w[true false], subject:)
  answer = Answer.create!(question:, subject:, value: 'A', year: '1990')

  it 'value must not be blank' do
    answer.value = nil
    expect(answer).to_not be_valid
  end

  it 'value must not be blank' do
    answer.year = nil
    expect(answer).to_not be_valid
  end
end
