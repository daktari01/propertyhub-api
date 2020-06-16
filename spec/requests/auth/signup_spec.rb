require 'rails_helper'

RSpec.describe 'POST /users/signup', type: :request do
  let(:url) { '/users/signup' }
  let(:params) do
    {
      user: {
        email: 'user@example.com',
        password: 'password',
        username: 'user1',
        image_url: 'https://fakeimg.pl/300/'
      }
    }
  end

  context 'when user is unauthenticated' do
    subject { post url, params: params }

    it 'returns 201' do
      subject
      expect(response.status).to eq 201
    end

    it 'returns a new user' do
      expect { subject }.to change(User, :count).by(1) 
    end

    it 'returns JWT token in authorization header' do
      subject
      expect(response.headers['Authorization']).to be_present
    end

    it 'returns valid JWT token' do
      subject
      token = response.headers['Authorization'].split(' ')[-1]
      key = ENV['DEVISE_SECRET_KEY']
      decoded_token = JWT.decode(token, key)[0]
      expect(decoded_token).to have_key('sub')
    end
  end

  context 'when user already exists' do
    before do
      create :user, email: params[:user][:email]
      post url, params: params
    end

    it 'returns bad request status' do
      expect(response.status).to eq 422
    end

    it 'returns validation errors' do
      expect(response.body).to include('Bad Request')
    end
  end
end
