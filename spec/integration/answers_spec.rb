require 'swagger_helper'

RSpec.describe 'Answers', type: :request do
  path '/api/v1/answers' do
    parameter name: 'subject_id', in: :query, type: :integer, description: 'subject_id'
    parameter name: 'question_id', in: :query, type: :integer, description: 'question_id'
    get 'Gets all answers' do
      tags 'Answers'
      security [Bearer: []]
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

    post 'Creates an answer' do
      tags 'Answers'
      security [Bearer: []]
      consumes 'application/json', 'application/xml'
      parameter name: :answers, in: :body, schema: {
        type: :object,
        properties: {
          answers: {
            type: :object,
            properties: {
              value: { type: :string },
              year: { type: :string }
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

  path '/api/v1/answers/{id}' do
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    get 'shows answer' do
      tags 'Answers'
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

    patch 'updates answer' do
      tags 'Answers'
      security [Bearer: []]
      consumes 'application/json', 'application/xml'
      parameter name: :answers, in: :body, schema: {
        type: :object,
        properties: {
          answers: {
            type: :object,
            properties: {
              value: { type: :string },
              year: { type: :string }
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

  path '/api/v1/answers/{id}' do
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    put 'updates answer' do
      tags 'Answers'
      security [Bearer: []]
      consumes 'application/json', 'application/xml'
      parameter name: :answers, in: :body, schema: {
        type: :object,
        properties: {
          answers: {
            type: :object,
            properties: {
              value: { type: :string },
              year: { type: :string }
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

    delete 'deletes answer' do
      tags 'Answers'
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
