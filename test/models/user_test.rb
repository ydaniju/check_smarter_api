# frozen_string_literal: true
require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = build(:user)
  end

  test "should not save without complete attributes" do
    user = User.new
    assert_not user.save
  end

  test "should save with complete attributes" do
    test_user = User.new(firstname: @user.firstname,
                         lastname: @user.lastname,
                         email: @user.email)
    assert test_user.save
  end
end
