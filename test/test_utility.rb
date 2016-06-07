# frozen_string_literal: true
module TestUtility
  def token_builder(user)
    JsonWebToken.encode(user_id: user.id)
  end
end
