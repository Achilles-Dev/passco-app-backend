require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create!(username: 'Solomon', email: 'test@test.com', password: '123456') }

  it 'username must not be blank' do
    subject.username = nil
    expect(subject).to_not be_valid
  end

  it 'email must not be blank' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'password must be valid' do
    subject.password = '1234'
    expect(subject).to_not be_valid
  end

  it 'password must be valid' do
    expect(subject.valid_password?('123456')).to be_truthy
  end

  # it 'code must be an integer' do
  #   subject.code = '3'
  #   expect(subject).to_not be_valid
  # end

  # it 'code must be between 100 and 1000' do
  #   subject.code = 1800
  #   expect(subject).to_not be_valid
  # end

  # it 'code must be between 100 and 1000' do
  #   subject.code = 99
  #   expect(subject).to_not be_valid
  # end
end
