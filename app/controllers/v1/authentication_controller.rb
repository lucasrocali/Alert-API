class V1::AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate
  
  # return auth token once user is authenticated
  def authenticate
    api_token = request.headers["ApiToken"]
    apiUser = ApiUser.where(api_token: api_token).first

    if !apiUser.nil?
      user =
      AuthenticateUser.new(auth_params[:email], auth_params[:password],apiUser.id, true).call

      render json: user
    else
      json_response({ message: Message.invalid_api_token }, 422)
    end 
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
