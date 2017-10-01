class V1::CategoryPreferencesController < ApplicationController
  before_action :set_category_preference, only: [:show, :update, :destroy]

  # POST /category_preferences
  def create
    # create category_preferences belonging to current user
    @category_preference = CategoryPreference.create(category_preference_params)
    @category_preference.user_id = current_user.id
    @category_preference.save!
    json_response(@category_preference, :created)
  end

  # DELETE /category_preferences/:id
  def destroy
    @category_preference.destroy
    head :no_content
  end

  private

  # remove `user_id` from list of permitted parameters
  def category_preference_params
    params.permit(:user_id, :category_id)
  end

  def set_category_preference
    @category_preference = CategoryPreference.find(params[:id])
  end
end
