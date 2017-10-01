class V1::LocationsController < ApplicationController
  before_action :set_location, only: [:show, :update, :destroy]

  # GET /locations
  def index
    # get current user locations
    @locations = current_user.locations
    render :json => @locations
  end

  # GET /locations/:id
  def show
    render :json => @location
  end

  # POST /locations
  def create
    # create locations belonging to current user
    @location = Location.new(location_params)
    @location.user_id = current_user.id
    @location.save!
    json_response(@location, :created)
  end

  # PUT /locations/:id
  def update
    @location.update(location_params)
    head :no_content
  end

  # DELETE /locations/:id
  def destroy
    @location.destroy
    head :no_content
  end

  private

  # remove `user_id` from list of permitted parameters
  def location_params
    params.permit(:user_id, :lat, :lon)
  end

  def set_location
    @location = Location.find(params[:id])
  end
end
