# frozen_string_literal: true
require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "#initialize" do
    user = User.new
    assert user
  end
end
