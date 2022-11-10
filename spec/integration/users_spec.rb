require 'swagger_helper'

RSpec.describe 'Users', type: :request do
  path '/api/v1/users' do
    get 'Gets all users' do
      security [Bearer: []]
      tags 'Users'
      response(200, 'successful') do
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    parameter name: 'id', in: :path, type: :integer, description: 'id'
    let(:id) { '123' }
    get('show user') do
      security [Bearer: []]
      tags 'Users'
      response(200, 'successful') do
        run_test!
      end
    end

    patch('update user') do
      security [Bearer: []]
      tags 'Users'
      consumes 'application/json', 'application/xml'
      parameter name: :questions, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              username: { type: :string },
              email: { type: :string },
              password: { type: :string },
              role: { type: :string }
            }
          }
        }
      }
      response(200, 'successful') do
        let(:user) do
          { user:
            { username: 'test', email: 'test3@test.com', password: '123456', role: 'student' } }
        end
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    parameter name: 'id', in: :path, type: :integer, description: 'id'
    let(:id) { '123' }
    put('update user') do
      tags 'Users'
      security [Bearer: []]
      consumes 'application/json', 'application/xml'
      parameter name: :questions, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              username: { type: :string },
              email: { type: :string },
              password: { type: :string },
              role: { type: :string }
            }
          }
        }
      }
      response(200, 'successful') do
        let(:user) do
          { user:
            { username: 'test', email: 'test3@test.com', password: '123456', role: 'student' } }
        end
        run_test!
      end
    end

    delete('delete user') do
      security [Bearer: []]
      tags 'Users'
      response(200, 'successful') do
        run_test!
      end
    end
  end
end
