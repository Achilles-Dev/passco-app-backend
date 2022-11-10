require 'swagger_helper'

RSpec.describe 'Subject', type: :request do
  path '/api/v1/subjects' do
    get 'Gets all subjects' do
      tags 'Subjects'
      security [Bearer: []]
      response(200, 'successful') do
        run_test!
      end
    end

    post('Create a subject') do
      consumes 'application/json', 'application/xml'
      security [Bearer: []]
      tags 'Subjects'
      parameter name: :subjects, in: :body, schema: {
        type: :object,
        properties: {
          subjects: {
            type: :object,
            properties: {
              name: { type: :string },
              code: { type: :integer }
            }
          }
        }
      }
      response(201, 'successful') do
        after do
          let(:subjects) do
            { subjects:
              { name: 'Social Studies', code: 302 } }
          end
        end
        run_test!
      end
    end
  end

  path '/api/v1/subjects/{id}' do
    parameter name: 'id', in: :path, type: :integer, description: 'id'
    let(:id) { '123' }
    get('show subject') do
      security [Bearer: []]
      tags 'Subjects'
      response(200, 'successful') do
        run_test!
      end
    end

    patch('update subject') do
      security [Bearer: []]
      tags 'Subjects'
      consumes 'application/json', 'application/xml'
      parameter name: :subjects, in: :body, schema: {
        type: :object,
        properties: {
          subjects: {
            type: :object,
            properties: {
              name: { type: :string },
              code: { type: :integer }
            }
          }
        }
      }
      response(204, 'successful') do
        after do
          let(:subjects) do
            { subjects:
              { name: 'Social Studies', code: 302 } }
          end
        end
        run_test!
      end
    end
  end

  path '/api/v1/subjects/{id}' do
    parameter name: 'id', in: :path, type: :integer, description: 'id'
    let(:id) { '123' }
    put('update subject') do
      security [Bearer: []]
      tags 'Subjects'
      consumes 'application/json', 'application/xml'
      parameter name: :subjects, in: :body, schema: {
        type: :object,
        properties: {
          subjects: {
            type: :object,
            properties: {
              name: { type: :string },
              code: { type: :integer }
            }
          }
        }
      }
      response(204, 'successful') do
        after do
          let(:subjects) do
            { subjects:
              { name: 'Social Studies', code: 302 } }
          end
        end
        run_test!
      end
    end

    delete('delete subject') do
      security [Bearer: []]
      tags 'Subjects'
      response(204, 'successful') do
        run_test!
      end
    end
  end
end
