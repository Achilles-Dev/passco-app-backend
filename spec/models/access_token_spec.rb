require 'rails_helper'

RSpec.describe AccessToken, type: :model do
  user = User.new(username: 'Solomon2', email: 'test2@test.com', password: '123456')

  token = user.generate_jwt

  subject { AccessToken.create!(token:, user:) }

  it 'token must not be blank' do
    subject.token = nil
    expect(subject).to_not be_valid
  end
end
