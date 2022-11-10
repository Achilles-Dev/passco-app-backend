require 'swagger_helper'

RSpec.describe 'Questions', type: :request do
  path '/api/v1/questions' do
    parameter name: 'subject_id', in: :query, type: :integer, description: 'subject_id'
    parameter name: 'year', in: :query, type: :integer, description: 'year'
    let(:subject_id) { 1 }
    let(:year) { 1990 }
    get 'Gets all questions' do
      tags 'Questions'
      security [Bearer: []]
      response(200, 'successful') do
        run_test!
      end
    end

    post 'Create a question' do
      tags 'Questions'
      security [Bearer: []]
      consumes 'application/json', 'application/xml'
      parameter name: :questions, in: :body, schema: {
        type: :object,
        properties: {
          questions: {
            type: :object,
            properties: {
              question_no: { type: :integer },
              content: { type: :string },
              options: { type: :array,
                         items: {
                           type: :string
                         } }
            }
          }
        }
      }
      response(201, 'successful') do
        after do
          let(:questions) do
            { questions:
              { content: '', value: 'A', question_no: 1, options: %w[true false] } }
          end
        end
        run_test!
      end
    end
  end

  path '/api/v1/questions/{id}' do
    parameter name: 'id', in: :path, type: :integer, description: 'id'
    let(:id) { '123' }
    get 'show question' do
      tags 'Questions'
      security [Bearer: []]
      response(200, 'successful') do
        run_test!
      end
    end

    patch 'update question' do
      tags 'Questions'
      security [Bearer: []]
      consumes 'application/json', 'application/xml'
      parameter name: :questions, in: :body, schema: {
        type: :object,
        properties: {
          questions: {
            type: :object,
            properties: {
              question_no: { type: :integer },
              content: { type: :string },
              options: { type: :integer }
            }
          }
        }
      }
      response(204, 'successful') do
        after do
          let(:questions) do
            { questions:
              { content: '', value: 'A', question_no: 1, options: %w[true false] } }
          end
        end
        run_test!
      end
    end
  end

  path '/api/v1/questions/{id}' do
    parameter name: 'id', in: :path, type: :integer, description: 'id'
    let(:id) { '123' }
    put 'update question' do
      tags 'Questions'
      security [Bearer: []]
      consumes 'application/json', 'application/xml'
      parameter name: :questions, in: :body, schema: {
        type: :object,
        properties: {
          questions: {
            type: :object,
            properties: {
              question_no: { type: :integer },
              content: { type: :string },
              options: { type: :integer }
            }
          }
        }
      }
      response(204, 'successful') do
        after do
          let(:questions) do
            { questions:
              { content: '', value: 'A', question_no: 1, options: %w[true false] } }
          end
        end
        run_test!
      end
    end

    delete 'delete question' do
      tags 'Questions'
      security [Bearer: []]
      response(204, 'successful') do
        run_test!
      end
    end
  end
end
