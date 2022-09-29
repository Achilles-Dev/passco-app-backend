require 'swagger_helper'

RSpec.describe 'Users', type: :request do
  path '/api/v1/user_data' do
    get 'Gets all user_data' do
      security [Bearer: []]
      tags 'User Data'
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post 'Create a user_datum' do
      tags 'User Data'
      security [Bearer: []]
      consumes 'application/json', 'application/xml'
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
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/user_data/{id}' do
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    get('show user_datum') do
      security [Bearer: []]
      tags 'User Data'
      response(200, 'successful') do
        let(:id) { '123' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update user_datum') do
      security [Bearer: []]
      tags 'User Data'
      consumes 'application/json', 'application/xml'
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
      response(200, 'successful') do
        let(:id) { '123' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/user_data/{id}' do
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    put('update user_datum') do
      tags 'User Data'
      security [Bearer: []]
      consumes 'application/json', 'application/xml'
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
      response(200, 'successful') do
        let(:id) { '123' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete user_datum') do
      security [Bearer: []]
      tags 'User Data'
      response(200, 'successful') do
        let(:id) { '123' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
