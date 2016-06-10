# frozen_string_literal: true
require "test_helper"

class ChecklistsControllerTest < ActionController::TestCase
  def setup
    @controller = Api::V1::ChecklistsController.new
    @checklist = build :checklist
    @token = token_builder(@checklist.user)
  end

  test "display all checklist if authorized" do
    @request.headers["Authorization"] = @token
    get :index, params: {
      user_id: @checklist.user_id,
      format: :json
    }

    assert_response :success
  end

  test "display error checklist if unauthorized" do
    get :index, params: {
      user_id: @checklist.user_id
    }

    assert_response :unauthorized
  end

  test "show checklist if exist" do
    @request.headers["Authorization"] = @token
    @checklist.save
    get :show, params: {
      user_id: @checklist.user_id,
      id: @checklist.id,
      format: :json
    }

    assert_response :success
  end

  test "doesn't show checklist if no token" do
    @checklist.save
    get :show, params: {
      user_id: @checklist.user_id,
      id: @checklist.id
    }

    assert_response :unauthorized
  end

  test "doesn't show checklist if token is invalid" do
    @request.headers["Authorization"] = "invalid_token"
    @checklist.save
    get :show, params: {
      user_id: @checklist.user_id,
      id: @checklist.id
    }

    assert_response :unauthorized
  end

  test "show missing if checklist does not exist" do
    @request.headers["Authorization"] = @token
    @checklist.save
    get :show, params: {
      user_id: @checklist.user_id,
      id: @checklist.id + 1
    }

    assert_response :missing
  end

  test "successful creation of checklist with title" do
    @request.headers["Authorization"] = @token
    post :create, params: {
      title: @checklist.title,
      user_id: @checklist.user_id,
      format: :json
    }

    assert_response :success
  end

  test "unsuccessful creation of checklist when no title" do
    @request.headers["Authorization"] = @token
    post :create, params: {
      user_id: @checklist.user_id
    }

    assert_response :unprocessable_entity
  end

  test "successful update of checklist" do
    @checklist.save
    @request.headers["Authorization"] = @token
    put :update, params: {
      user_id: @checklist.user_id,
      id: @checklist.id,
      title: "Laplace",
      format: :json
    }

    assert_response :success
  end

  test "unsuccessful update of checklist when title is incorrect" do
    @checklist.save
    @request.headers["Authorization"] = @token
    put :update, params: {
      user_id: @checklist.user_id,
      id: @checklist.id,
      title: nil,
      format: :json
    }

    assert_response :unprocessable_entity
  end

  test "destroy checklist" do
    @checklist.save
    @request.headers["Authorization"] = @token
    get :destroy, params: {
      user_id: @checklist.user_id,
      id: @checklist.id
    }

    assert_response 204
  end
end
