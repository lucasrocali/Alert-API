class V1::TagPreferencesController < ApplicationController
  before_action :set_tag_preference, only: [:show, :update, :destroy]

  # POST /tag_preferences
  def create
    # create tag_preferences belonging to current user
    @tag_preference = TagPreference.create(tag_preference_params)
    @tag_preference.user_id = current_user.id
    @tag_preference.save!
    json_response(@tag_preference, :created)
  end

  # DELETE /tag_preferences/:id
  def destroy
    @tag_preference.destroy
    head :no_content
  end

  private

  # remove `user_id` from list of permitted parameters
  def tag_preference_params
    params.permit(:user_id, :tag_id)
  end

  def set_tag_preference
    @tag_preference = TagPreference.find(params[:id])
  end
end
