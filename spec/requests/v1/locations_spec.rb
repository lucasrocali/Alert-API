require 'rails_helper'

RSpec.describe 'locations API', type: :request do
  # add locations owner
  let(:api_user) { create(:api_user) }
  let!(:user) { create(:user, api_user_id: api_user.id) }
  let!(:locations) { create_list(:location, 10, user_id: user.id) }
  let(:location_id) { locations.first.id }
  # authorize request
  let(:headers) { valid_headers }

  describe 'GET /locations' do
    # update request with headers
    before { get '/locations', params: {}, headers: headers }

    it 'returns locations' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /locations/:id' do
    before { get "/locations/#{location_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the location' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(location_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:location_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Location/)
      end
    end
  end

  let!(:location_to_insert) { build(:location) }

  describe 'POST /locations' do
     let(:valid_attributes) do
      # send json payload
      { lat: location_to_insert.lat, lon: location_to_insert.lon }.to_json
    end

    context 'when request is valid' do
      before { post '/locations', params: valid_attributes, headers: headers }

      it 'creates a location' do
        expect(json['lat']).to eq(location_to_insert.lat)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when request is invalid' do
      let(:valid_attributes) { { lat: nil, }.to_json }
      before { post '/locations', params: valid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Lat can't be blank/)
      end
    end
  end

  describe 'PUT /locations/:id' do
    let(:valid_attributes) { { lat: location_to_insert.lat}.to_json }

    context 'when the record exists' do
      before { put "/locations/#{location_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /locations/:id' do
    before { delete "/locations/#{location_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

