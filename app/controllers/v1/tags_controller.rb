class V1::TagsController < ApplicationController
  before_action :set_tag, only: [:show, :update, :destroy]

  # GET /tags
  def index
    # get current user tags
    @tags = current_user.api_user.tags
    render :json => @tags
  end

  # GET /tags/:id
  def show
    render :json => @tag
  end

  # POST /tags
  def create
    # create tags belonging to current user
    @tag = Tag.new(tag_params)
    @tag.api_user_id = current_user.api_user.id
    @tag.save!
    json_response(@tag, :created)
  end

  # PUT /tags/:id
  def update
    @tag.update(tag_params)
    head :no_content
  end

  # DELETE /tags/:id
  def destroy
    @tag.destroy
    head :no_content
  end

  private

  # remove `user_id` from list of permitted parameters
  def tag_params
    params.permit(:api_user_id, :name, :tag_id)
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end
end
