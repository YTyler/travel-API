require 'swagger_helper'

describe 'Travel API' do

  path '/countries' do

    post 'Creates a country' do
      tags 'Countries'
      consumes 'application/json', 'application/xml'
      parameter name: :country, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
        },
        required: [ 'name' ]
      }

      response '201', 'country created' do
        let(:country) { { name: 'Candy Land'} }
        run_test!
      end

      response '422', 'invalid request' do
        let(:country) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/countries/{id}' do

    get 'Retrieves a country' do
      tags 'Countries'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'name found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            name: { type: :string }
          },
          required: [ 'id', 'name', 'status' ]

        let(:id) { Country.create(name: 'foo')}
        run_test!
      end

      response '404', 'country not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
