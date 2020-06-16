require 'rails_helper'

RSpec.describe 'properties', type: :request do
  let(:user) { create(:user) }
  let(:url) { '/api/v1/properties' }
  let(:login_url) { '/users/login' }
  let(:params) do
    {
      user_id: user.id,
      property_type: 'residential',
      name: 'K. Bernado Street',
      location: '625 S. Berendo St Unit 607 Los Angeles, CA 90005',
      price: 46739,
      rent_sale: [
          'rent',
          'sale'
      ],
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      image_urls: [
          'https://res.cloudinary.com/daktari/image/upload/v1583219813/propertyhub/img_1_x9mfqb.jpg'
      ]
    }
  end
  let(:wrong_params) do
    {
      user_id: user.id,
      location: '625 S. Berendo St Unit 607 Los Angeles, CA 90005',
    }
  end

  let(:user_login_params) do
    {
      user: {
        email: user.email,
        password: user.password
      }
    }
  end

  context 'when user is signed in', :test do
    before do
      binding.pry
      authenticated_header(user)
      post url, params: params
    end
    context 'when params are correct do' do
      it 'returns status 201' do
        expect(response).to have_http_status(201)
      end
    end
    context 'when params are wrong' do
      before do
        post url, params: wrong_params
      end
      it 'returns status 422' do
        expect(response).to have_http_status(422)
      end

      # it 'returns error messages' do
      #   binding.pry
      #   expect(response)
      # end
    end
  end

  context 'when user is not signed in' do
    before do
      post url, params: params
    end
    it 'returns status 401 unauthorised' do
      expect(response).to have_http_status(401)
    end

    it 'returns relevant error message' do
      expect(response.body).to include('You need to sign in or sign up before continuing')
    end
  end
end
