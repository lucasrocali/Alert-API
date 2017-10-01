class V1::StrengthsController < ApplicationController
  before_action :set_strength, only: [:show, :update, :destroy]

  # POST /strengths
  def create
    # create strengths belonging to current user
    @strength = Strength.create(strength_params)
    @strength.user_id = current_user.id
    @strength.save!
    json_response(@strength, :created)
  end

  # DELETE /strengths/:id
  def destroy
    @strength.destroy
    head :no_content
  end

  private

  # remove `user_id` from list of permitted parameters
  def strength_params
    params.permit(:event_id, :user_id, :up_down)
  end

  def set_strength
    @strength = Strength.find(params[:id])
  end
end
