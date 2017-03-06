require 'test_helper'

class AskControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

  test "should get list" do
    get :list
    assert_response :success
  end

  test "should get detail" do
    get :detail
    assert_response :success
  end

end
