# frozen_string_literal: true
class AuthenticateApiRequest
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

    extract_user_from_token token
  end

  def get_token
    return headers["Authorization"].split(" ")[-1] if headers["Authorization"]
    params[:token]
  end

  def token_not_found?(token)
    if token.nil?
      errors.add :errors, "Token not found."

      true
    end
  end

  def extract_user_from_token(token)
    decoded_token = JsonWebToken.decode(token)
    if decoded_token
      match_id_to_user decoded_token["user_id"]
    else
      errors.add :errors, "Token not valid."
    end
  end

  def match_id_to_user(user_id)
    user = User.find_by(id: user_id)
    errors.add :errors, "Token not valid." unless user

    user
  end
end
