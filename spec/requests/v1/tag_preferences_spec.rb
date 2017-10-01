require 'rails_helper'

RSpec.describe 'tag_preferences API', type: :request do
  # add tag_preferences owner
  let(:api_user) { create(:api_user) }
  let!(:user) { create(:user, api_user_id: api_user.id) }
  let(:tag) { create(:tag, api_user_id: api_user.id) }
  let!(:tag_preferences) { create_list(:tag_preference, 10, user_id: user.id, tag_id: tag.id ) }
  let(:tag_preference_id) { tag_preferences.first.id }
  # authorize request
  let(:headers) { valid_headers }

  describe 'POST /tag_preferences' do
     let(:valid_attributes) do
      # send json payload
      { tag_id: tag.id }.to_json
    end

    context 'when request is valid' do
      before { post '/tag_preferences', params: valid_attributes, headers: headers }

      it 'creates a tag_preferences' do
        expect(json).not_to be_empty
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when request is invalid' do
      let(:valid_attributes) { { user_id: nil, }.to_json }
      before { post '/tag_preferences', params: valid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Tag must exist/)
      end
    end
  end

  describe 'DELETE /tag_preferences/:id' do
    before { delete "/tag_preferences/#{tag_preference_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

