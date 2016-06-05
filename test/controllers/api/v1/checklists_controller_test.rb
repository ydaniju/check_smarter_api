# frozen_string_literal: true
require "test_helper"

class ChecklistsControllerTest < ActionController::TestCase
  def setup
    @controller = Api::V1::ChecklistsController.new
    @checklist = build :checklist
  end

  test "display all checklist" do
    get :index, params: {
      user_id: @checklist.user_id
    }

    assert_response :success
  end

  test "show checklist if exist" do
    @checklist.save
    get :show, params: {
      user_id: @checklist.user_id,
      id: @checklist.id
    }

    assert_response :success
  end

  test "show missing if checklist does not exist" do
    @checklist.save
    get :show, params: {
      user_id: @checklist.user_id,
      id: @checklist.id + 1
    }

    assert_response :missing
  end

  test "successful creation of checklist with title" do
    post :create, params: {
      title: @checklist.title,
      user_id: @checklist.user_id
    }

    assert_response :success
  end

  test "unsuccessful creation of checklist when no title" do
    post :create, params: {
      user_id: @checklist.user_id
    }

    assert_response :unprocessable_entity
  end
end
