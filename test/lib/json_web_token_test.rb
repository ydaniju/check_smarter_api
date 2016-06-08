# frozen_string_literal: true
class JsonWebTokenTest < ActiveSupport::TestCase
  def setup
    @user = create :user
    @token = JsonWebToken.encode(user_id: @user.id)
  end
  test "encode: is a class method of JsonWebToken" do
    assert_respond_to JsonWebToken, :encode
  end

  test "encode has effect same as that of JWT" do
    payload = { user_id: @user.id }
    custom_token = JsonWebToken.encode(payload)
    jwt_token = JWT.encode(payload, Rails.application.secrets.secret_key_base)
    assert_equal custom_token.length, jwt_token.length
  end

  test "decode is a class method of JsonWebToken" do
    assert_respond_to JsonWebToken, :decode
  end

  test "decode return user_id from token" do
    decoded_token = JsonWebToken.decode(@token)

    assert_equal @user.id, decoded_token[:user_id]
  end

  test "decode return nil if no user_id" do
    decoded_token = JsonWebToken.decode("bad_token")

    assert_nil decoded_token
  end
end
