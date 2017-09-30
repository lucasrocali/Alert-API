module ControllerSpecHelper
  # generate tokens from user id
  def token_generator(user_id)
    JsonWebToken.encode(user_id: user_id)
  end

  # generate expired tokens from user id
  def expired_token_generator(user_id)
    JsonWebToken.encode({ user_id: user_id }, (Time.now.to_i - 10))
  end

  # return auth valid headers
  def auth_valid_headers(api_user)
    {
      "Accept" => "application/alert.v1+json",
      "Content-Type" => "application/json",
      "ApiToken" => api_user.api_token
    }
  end
  # return valid headers
  def valid_headers
    {
      "Accept" => "application/alert.v1+json",
      "Authorization" => token_generator(user.id),
      "Content-Type" => "application/json"
    }
  end

  # return invalid headers
  def invalid_headers
    {
      "Authorization" => nil,
      "Content-Type" => "application/json"
    }
  end
end