require 'rails_helper'

RSpec.describe 'POST /users/login', type: :request do
  let(:user) { create(:user) }
  let(:url) { '/users/login' }
  let(:params) do
    {
      user: {
        email: user.email,
        password: user.password
      }
    }
  end

  context 'when params are correct' do
    before do
      post url, params: params
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns JWT token in authorization header' do
      expect(response.headers['Authorization']).to be_present
    end

    it 'returns valid JWT token' do
      token = response.headers['Authorization'].split(' ').last
      key = ENV['DEVISE_SECRET_KEY']
      decoded_token = JWT.decode(token, key)[0]
      expect(decoded_token).to have_key('sub')
    end
  end

  context 'when login params are incorrect' do
    before { post url }

    it 'returns unauthorized status' do
      expect(response.status).to eq 401
    end
  end
end

RSpec.describe 'DELETE /users/logout', type: :request do
  let(:url) { '/users/logout' }

  it 'returns 204, no content' do
    delete url
    expect(response).to have_http_status(204)
  end
end
