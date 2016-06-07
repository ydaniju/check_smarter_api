# frozen_string_literal: true
class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    if user
      token = JsonWebToken.encode(user_id: user.id)

      {
        auth_token: token
      }
    end
  end

  private

  attr_accessor :email, :password

  def user
    user = User.find_for_database_authentication(email: email)
    return user if user.valid_password?(password)

    errors.add :errors, "Incorrect email/password combination"
    nil
  end
end
