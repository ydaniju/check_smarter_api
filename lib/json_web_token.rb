# frozen_string_literal: true
class JsonWebToken
  def self.encode(payload)
    payload["exp"] = 24.hours.from_now
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def self.decode(token)
    return HashWithIndifferentAccess.new(JWT.decode(
      token,
      Rails.application.secrets.secret_key_base
    ).first)
  rescue
    nil
  end
end
