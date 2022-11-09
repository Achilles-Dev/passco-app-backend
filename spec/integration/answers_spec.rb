require 'swagger_helper'

RSpec.describe 'Answers', type: :request do
  let(:Authorization) do
    'Bearer eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MSwiZXhwIjoxNjY5NTYyNDE0fQ.VaMUJJS4Sg1XofPnZq5F9H0O6_k0G82nUIjyY7Ij_M0'
  end

  path '/api/v1/answers' do
    parameter name: 'subject_id', in: :query, type: :integer, description: 'subject_id'
    let(:subject_id) { 1 }
    get 'Gets all answers' do
      tags 'Answers'
      security [Bearer: []]
      response(200, 'successful')
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
              year: { type: :string },
              answer_no: { type: :integer }
            }
          }
        },
        required: %w[value year answer_no]
      }
      response '201', 'successful' do
        let(:answers) do
          { answers:
            { value: 'A', year: '1993', answer_no: 1 } }
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
      response(200, 'successful')
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
              year: { type: :string },
              answer_no: { type: :integer }
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
              year: { type: :string },
              answer_no: { type: :integer }
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
      response(200, 'successful')
    end
  end
end
