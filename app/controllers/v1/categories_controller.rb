class V1::CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]

  # GET /categories
  def index
    # get current user categories
    @categories = current_user.api_user.categories
    render :json => @categories
  end

  # GET /categories/:id
  def show
    render :json => @category
  end

  # POST /categories
  def create
    # create categories belonging to current user
    @category = Category.new(category_params)
    @category.api_user_id = current_user.api_user.id
    @category.save!
    json_response(@category, :created)
  end

  # PUT /categories/:id
  def update
    @category.update(category_params)
    head :no_content
  end

  # DELETE /categories/:id
  def destroy
    @category.destroy
    head :no_content
  end

  private

  # remove `user_id` from list of permitted parameters
  def category_params
    params.permit(:api_user_id, :name, :image_url, :category_id)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
