class V1::UsersController < ApplicationController
  skip_before_action :authorize_request, only: [:signup]
  
	def signup
    api_token = request.headers["ApiToken"]
    apiUser = ApiUser.where(api_token: api_token).first

    if !apiUser.nil?
   
      params[:api_user_id] = apiUser.id

      @user = User.new(user_params)
      @user.save!
      @user = AuthenticateUser.new(params[:email], params[:password],apiUser.id, false).call
      render json: @user
    else
      json_response({ message: Message.invalid_api_token }, 422)
    end
  end

  private

  def user_params
    params.permit(
      :api_user_id,
      :email,
      :password,
      :password_confirmation,
      user_info_attributes: [
        :name
      ]
    )

  end

end