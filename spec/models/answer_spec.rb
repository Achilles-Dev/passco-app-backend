require 'rails_helper'

RSpec.describe Answer, type: :model do
  subject = Subject.create!(name: 'English Language', code: 302)
  question = Question.create!(year: 2022, question_no: 1, content: 'This is the first question.',
                              options: %w[true false], subject:)
  answer = Answer.create!(question:, subject:, answer_no: 1, value: 'A', year: 2022)

  it 'year must not be blank' do
    answer.year = nil
    expect(answer).to_not be_valid
  end
  it 'year must be between 1900 and current year' do
    answer.year = 1800
    expect(answer).to_not be_valid
  end

  it 'answer_no must not be blank' do
    answer.answer_no = nil
    expect(answer).to_not be_valid
  end

  it 'answer_no must be an integer' do
    answer.answer_no = '3'
    expect(answer).to_not be_valid
  end

  it 'value must not be blank' do
    answer.value = nil
    expect(answer).to_not be_valid
  end
end
