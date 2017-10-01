require 'rails_helper'

RSpec.describe 'tags API', type: :request do
  # add tags owner
  let(:api_user) { create(:api_user) }
  let!(:user) { create(:user, api_user_id: api_user.id) }
  let!(:tags) { create_list(:tag, 10) }
  let(:tag_id) { tags.first.id }
  # authorize request
  let(:headers) { valid_headers }

  describe 'GET /tags' do
    # update request with headers
    before { get '/tags', params: {}, headers: headers }

    it 'returns tags' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /tags/:id' do
    before { get "/tags/#{tag_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the tag' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(tag_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:tag_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Tag/)
      end
    end
  end

  let!(:tag_to_insert) { build(:tag) }

  describe 'POST /tags' do
     let(:valid_attributes) do
      # send json payload
      { name: tag_to_insert.name }.to_json
    end

    context 'when request is valid' do
      before { post '/tags', params: valid_attributes, headers: headers }

      it 'creates a tag' do
        expect(json['name']).to eq(tag_to_insert.name)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when request is invalid' do
      let(:valid_attributes) { { name: nil }.to_json }
      before { post '/tags', params: valid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PUT /tags/:id' do
    let(:valid_attributes) { { name: 'Name 2'}.to_json }

    context 'when the record exists' do
      before { put "/tags/#{tag_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /tags/:id' do
    before { delete "/tags/#{tag_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

