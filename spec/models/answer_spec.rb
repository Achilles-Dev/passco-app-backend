require 'rails_helper'

RSpec.describe Answer, type: :model do
  subject = Subject.create!(name: 'English Language', code: 302)

  answer = Answer.create!(subject:, value: 'A', year: '1990', answer_no: 1)

  it 'value must not be blank' do
    answer.value = nil
    expect(answer).to_not be_valid
  end

  it 'year must not be blank' do
    answer.year = nil
    expect(answer).to_not be_valid
  end

  it 'year must be between 1900 and current year' do
    answer.year = 1899
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
end
