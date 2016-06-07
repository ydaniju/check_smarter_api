# frozen_string_literal: true
require "test_helper"

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    user = create :user
    token = token_builder(user)
    @request.headers["Authorization"] = token
    get :index
    assert_response :success
  end

  test "should not get index when not signed in" do
    get :index
    assert_response :unauthorized
  end
end
