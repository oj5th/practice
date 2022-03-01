require 'swagger_helper'

describe 'Book API' do
  path '/api/v1/book' do
    post 'Add Book Record' do
      tags 'Books'
      consumes 'application/json'
      parameter name: :book, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string }
        },
        required: ['title']
      }

      response '201', 'Successfully Added Book Record' do
        let(:book) { { title: 'Ruby Programming for Beginners' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:book) { {  } }
        run_test!
      end
    end
  end
end
