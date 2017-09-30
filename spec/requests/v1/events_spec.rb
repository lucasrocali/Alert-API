require 'rails_helper'

RSpec.describe 'events API', type: :request do
  # add events owner
  let(:api_user) { create(:api_user) }
  let!(:user) { create(:user, api_user_id: api_user.id) }
  let(:location) { build(:location, user_id: user.id) }
  let(:existing_location) { create(:location, user_id: user.id) }
  let!(:categories) { create_list(:category, 10, api_user_id: api_user.id) }
  let(:category) { categories.first }
  let!(:events) { create_list(:event, 10, location_id: existing_location.id, category_id: category.id) }
  let(:event_id) { events.first.id }
  # authorize request
  let(:headers) { valid_headers }

  describe 'GET /events' do
    # update request with headers
    before { get '/events', params: {}, headers: headers }

    it 'returns events' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /events/:id' do
    before { get "/events/#{event_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the event' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(event_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:event_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Event/)
      end
    end
  end

  describe 'POST /events' do
     let(:valid_attributes) do
      # send json payload
      { lat: location.lat, lon: location.lon, category_id: category.id, importance: 1, comment: 'comment'}.to_json
    end

    context 'when request is valid' do
      before { post '/events', params: valid_attributes, headers: headers }

      it 'creates a event' do
        expect(json['category']['id']).to eq(category.id)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when request is invalid' do
      let(:valid_attributes) { { location_id: nil }.to_json }
      before { post '/events', params: valid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Location must exist/)
      end
    end
  end

  describe 'PUT /events/:id' do
    let(:valid_attributes) { { location_id: location.id}.to_json }

    context 'when the record exists' do
      before { put "/events/#{event_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /events/:id' do
    before { delete "/events/#{event_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

