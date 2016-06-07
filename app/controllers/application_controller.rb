# frozen_string_literal: true
class ApplicationController < ActionController::API
  attr_reader :current_user

  private

  def authenticate_request!
    api_request_auth = AuthenticateApiRequest.call(request.headers, params)

    if api_request_auth.success?
      @current_user = api_request_auth.result
    else
      render json: api_request_auth.errors, status: :unauthorized
    end
  end
end
