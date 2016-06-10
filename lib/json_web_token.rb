# frozen_string_literal: true
class JsonWebToken
  def self.encode(payload, exp = 48.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.secrets.secret_key_base, "HS256")
  end

  def self.decode(token)
    body = JWT.decode(
      token,
      Rails.application.secrets.secret_key_base,
      true,
      algorithm: "HS256"
    ).first
    HashWithIndifferentAccess.new body
  rescue
    nil
  end
end
