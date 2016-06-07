# frozen_string_literal: true
class AuthenticateApiRequests
  prepend SimpleCommand
  attr_reader :headers, :params

  def initialize(headers, params)
    @headers = headers
    @params = params
  end

  def call
    user
  end

  private

  def user
    token = get_token
    return if token_not_found? token

    user_by_token token
  end

  def get_token
    auth_header = headers["Authorization"]
    return token_by_header auth_header if auth_header

    params[:token]
  end

  def token_by_header(auth_header)
    auth_header.split(":").last.split("token").last.strip
  end

  def token_not_found?(token)
    if token.nil?
      errors.add :errors, "Token not found."

      true
    end
  end

  def user_by_token(token)
    decoded_token = JsonWebToken.decode(token)
    if decoded_token
      match_id_to_user decoded_token["user_id"]
    else
      errors.add :errors, "Token not valid."
    end
  end

  def match_id_to_user(user_id)
    user = User.find_by_id(user_id)
    errors.add :errors, "Token not valid." unless user && user.token

    user
  end
end
