require 'swagger_helper'

RSpec.describe 'Users', type: :request do
  path '/api/v1/user_data' do
    get 'Gets all user_data' do
      security [Bearer: []]
      tags 'User Data'
      response(200, 'successful') do
        run_test!
      end
    end

    post 'Create a user_datum' do
      tags 'User Data'
      security [Bearer: []]
      consumes 'application/json', 'application/xml'
      parameter name: :subject_id, in: :query, type: :integer, description: 'subject_id'
      parameter name: :user_id, in: :query, type: :integer, description: 'user_id'
      parameter name: :user_data, in: :body, schema: {
        type: :object,
        properties: {
          user_data: {
            type: :object,
            properties: {
              score: { type: :integer }
            }
          }
        }
      }
      response(201, 'successful') do
        after do
          let(:user_data) do
            { user_data:
              { score: 40 } }
          end
        end
        run_test!
      end
    end
  end

  path '/api/v1/user_data/{id}' do
    parameter name: 'id', in: :path, type: :integer, description: 'id'
    let(:id) { '123' }
    get('show user_datum') do
      security [Bearer: []]
      tags 'User Data'
      response(200, 'successful') do
        run_test!
      end
    end

    delete('delete user_datum') do
      security [Bearer: []]
      tags 'User Data'
      response(204, 'successful') do
        run_test!
      end
    end
  end
end
