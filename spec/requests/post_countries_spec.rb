require 'rails_helper'

describe "post a country route", :type => :request do

  before do
    post '/countries', params: { :name => 'Candy Land'}
  end

  it 'returns the name of the country' do
    expect(JSON.parse(response.body)['name']).to eq('Candy Land')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
  
end
