class V1::EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    # get current user events
    @events = Event.all
    render :json => @events
  end

  # GET /events/:id
  def show
    render :json => @event
  end

  # POST /events
  def create
    # create events belonging to current user
    @event = Event.create!(event_params)
    json_response(@event, :created)
  end

  # PUT /events/:id
  def update
    @event.update(event_params)
    head :no_content
  end

  # DELETE /events/:id
  def destroy
    @event.destroy
    head :no_content
  end

  private

  # remove `user_id` from list of permitted parameters
  def event_params
    params.permit(:location_id, :category_id, :importance, :comment)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
