require 'rails_helper'

RSpec.describe 'strengths API', type: :request do
  # add strengths owner
  let(:api_user) { create(:api_user) }
  let!(:user) { create(:user, api_user_id: api_user.id) }
  let(:location) { create(:location, user_id: user.id) }
  let(:category) { create(:category, api_user_id: api_user.id) }
  let(:event) { create(:event, location_id: location.id, category_id: category.id) }
  let!(:strengths) { create_list(:strength, 10, user_id: user.id, event_id: event.id ) }
  let(:strength_id) { strengths.first.id }
  # authorize request
  let(:headers) { valid_headers }

  describe 'POST /strengths' do
     let(:valid_attributes) do
      # send json payload
      { event_id: event.id }.to_json
    end

    context 'when request is valid' do
      before { post '/strengths', params: valid_attributes, headers: headers }

      it 'creates a strengths' do
        expect(json).not_to be_empty
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when request is invalid' do
      let(:valid_attributes) { { user_id: nil, }.to_json }
      before { post '/strengths', params: valid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Event must exist/)
      end
    end
  end

  describe 'DELETE /strengths/:id' do
    before { delete "/strengths/#{strength_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

