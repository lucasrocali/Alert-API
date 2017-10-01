require 'rails_helper'

RSpec.describe 'categories API', type: :request do
  # add categories owner
  let(:api_user) { create(:api_user) }
  let!(:user) { create(:user, api_user_id: api_user.id) }
  let!(:categories) { create_list(:category, 10, api_user_id: api_user.id) }
  let(:category_id) { categories.first.id }
  # authorize request
  let(:headers) { valid_headers }

  describe 'GET /categories' do
    # update request with headers
    before { get '/categories', params: {}, headers: headers }

    it 'returns categories' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /categories/:id' do
    before { get "/categories/#{category_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the category' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(category_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:category_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Category/)
      end
    end
  end

  let!(:category_to_insert) { build(:category) }

  describe 'POST /categories' do
     let(:valid_attributes) do
      # send json payload
      { name: category_to_insert.name, image_url: category_to_insert.image_url }.to_json
    end

    context 'when request is valid' do
      before { post '/categories', params: valid_attributes, headers: headers }

      it 'creates a category' do
        expect(json['name']).to eq(category_to_insert.name)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when request is invalid' do
      let(:valid_attributes) { { name: nil, }.to_json }
      before { post '/categories', params: valid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PUT /categories/:id' do
    let(:valid_attributes) { { name: category_to_insert.name}.to_json }

    context 'when the record exists' do
      before { put "/categories/#{category_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /categories/:id' do
    before { delete "/categories/#{category_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

