class ApplicationController < ActionController::Base
  include Response
  include ExceptionHandler

  # called before every action on controllers
  before_action :authorize_request, except: [:static_pages]
  attr_reader :current_user

  private

  # Check for valid request token and return user
  def authorize_request
    if params['ApiToken'].present? && params['controller'] == 'v1/static_pages'
      @current_user = nil
    else
      @current_user = (::AuthorizeApiRequest.new(request.headers).call)[:user]
    end
  end
end
