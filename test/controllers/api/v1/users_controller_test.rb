# frozen_string_literal: true
require "test_helper"

class UsersControllerTest < ActionController::TestCase
  def setup
    @controller = Api::V1::UsersController.new
    @user = build :user
  end

  test "show user if exist" do
    @user.save

    get :show, params: {
      id: @user.id
    }

    assert_response :success
  end

  test "returns error if user does not exist" do
    @user.save

    get :show, params: {
      id: @user.id + 1
    }

    assert_response :missing
  end

  test "create is successful with correct params" do
    post :create, params: {
      firstname: @user.firstname,
      lastname: @user.lastname,
      email: @user.email
    }

    assert_response :created
  end

  test "create is unsuccessful with incorrect params" do
    post :create, params: {
      firstname: @user.firstname,
      email: @user.email
    }

    assert_response :unprocessable_entity
  end

  test "update is successful with correct params" do
    @user.save
    put :update, params: {
      id: @user.id,
      firstname: @user.firstname
    }

    assert_response :success
  end

  test "update is unsuccessful with incorrect params" do
    @user.save
    put :update, params: {
      id: @user.id,
      firstname: nil
    }

    assert_response :unprocessable_entity
  end

  test "delete user" do
    @user.save
    delete :destroy, params: {
      id: @user.id
    }

    assert_response :success
  end
end
