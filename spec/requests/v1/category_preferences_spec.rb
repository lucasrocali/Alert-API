require 'rails_helper'

RSpec.describe 'category_preferences API', type: :request do
  # add category_preferences owner
  let(:api_user) { create(:api_user) }
  let!(:user) { create(:user, api_user_id: api_user.id) }
  let(:category) { create(:category, api_user_id: api_user.id) }
  let!(:category_preferences) { create_list(:category_preference, 10, user_id: user.id, category_id: category.id ) }
  let(:category_preference_id) { category_preferences.first.id }
  # authorize request
  let(:headers) { valid_headers }

  describe 'POST /category_preferences' do
     let(:valid_attributes) do
      # send json payload
      { category_id: category.id }.to_json
    end

    context 'when request is valid' do
      before { post '/category_preferences', params: valid_attributes, headers: headers }

      it 'creates a category_preferences' do
        expect(json).not_to be_empty
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when request is invalid' do
      let(:valid_attributes) { { user_id: nil, }.to_json }
      before { post '/category_preferences', params: valid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Category must exist/)
      end
    end
  end

  describe 'DELETE /category_preferences/:id' do
    before { delete "/category_preferences/#{category_preference_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

