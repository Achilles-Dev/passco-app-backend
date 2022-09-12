require 'rails_helper'

RSpec.describe Question, type: :model do
  subject = Subject.create!(name: 'English Language', code: 302)
  question = Question.create!(year: 2022, question_no: 1, content: 'This is the first question.',
                              options: %w[true false], subject:)

  it 'year must not be blank' do
    question.year = nil
    expect(question).to_not be_valid
  end
  it 'year must be between 1900 and current year' do
    question.year = 1899
    expect(question).to_not be_valid
  end

  it 'question_no must not be blank' do
    question.question_no = nil
    expect(question).to_not be_valid
  end

  it 'question_no must be an integer' do
    question.question_no = '3'
    expect(question).to_not be_valid
  end

  it 'content must not be blank' do
    question.content = nil
    expect(question).to_not be_valid
  end

  it 'options must not be blank' do
    question.options = nil
    expect(question).to_not be_valid
  end
end
