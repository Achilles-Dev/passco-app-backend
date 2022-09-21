require 'rails_helper'

RSpec.describe Subject, type: :model do
  subject = Subject.create!(name: 'English Language', code: 302)

  it 'name must not be blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'code must not be blank' do
    subject.code = nil
    expect(subject).to_not be_valid
  end

  it 'code must be an integer' do
    subject.code = '3'
    expect(subject).to_not be_valid
  end

  it 'code must be between 100 and 1000' do
    subject.code = 1800
    expect(subject).to_not be_valid
  end

  it 'code must be between 100 and 1000' do
    subject.code = 99
    expect(subject).to_not be_valid
  end
end
