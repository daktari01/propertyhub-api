require 'rails_helper'

RSpec.describe 'GET /properties/1' do
  let(:url) { '/api/v1/properties' }

  before do
    get url
  end

  it 'returns status 200' do
    expect(response).to have_http_status(200)
  end
end