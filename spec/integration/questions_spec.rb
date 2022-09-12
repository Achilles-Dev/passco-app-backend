require 'swagger_helper'

RSpec.describe 'Questions', type: :request do
  path '/api/v1/questions' do
    parameter name: 'subject_id', in: :query, type: :integer, description: 'subject_id'

    get 'Gets all questions' do
      security [Bearer: []]
      parameter name: 'year', in: :query, type: :integer, description: 'year'
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

    post('Create a question') do
      consumes 'application/json', 'application/xml'
      security [Bearer: []]
      parameter name: :questions, in: :body, schema: {
        type: :object,
        properties: {
          questions: {
            type: :object,
            properties: {
              year: { type: :string },
              question_no: { type: :integer },
              content: { type: :string },
              options: { type: :array,
                items: {
                  type: :string
                }
              }
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

  path '/api/v1/questions/{id}' do
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    get('show question') do
      security [Bearer: []]
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

    patch('update question') do
      security [Bearer: []]
      consumes 'application/json', 'application/xml'
      parameter name: :questions, in: :body, schema: {
        type: :object,
        properties: {
          questions: {
            type: :object,
            properties: {
              year: { type: :string },
              question_no: { type: :integer },
              content: { type: :string },
              options: { type: :integer }
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

  path '/api/v1/questions/{id}' do
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    put('update question') do
      security [Bearer: []]
      consumes 'application/json', 'application/xml'
      parameter name: :questions, in: :body, schema: {
        type: :object,
        properties: {
          questions: {
            type: :object,
            properties: {
              year: { type: :string },
              question_no: { type: :integer },
              content: { type: :string },
              options: { type: :integer }
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

    delete('delete question') do
      security [Bearer: []]
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
