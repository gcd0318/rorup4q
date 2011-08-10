require 'test_helper'

class BugHistoriesControllerTest < ActionController::TestCase
  setup do
    @bug_history = bug_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bug_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bug_history" do
    assert_difference('BugHistory.count') do
      post :create, :bug_history => @bug_history.attributes
    end

    assert_redirected_to bug_history_path(assigns(:bug_history))
  end

  test "should show bug_history" do
    get :show, :id => @bug_history.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bug_history.to_param
    assert_response :success
  end

  test "should update bug_history" do
    put :update, :id => @bug_history.to_param, :bug_history => @bug_history.attributes
    assert_redirected_to bug_history_path(assigns(:bug_history))
  end

  test "should destroy bug_history" do
    assert_difference('BugHistory.count', -1) do
      delete :destroy, :id => @bug_history.to_param
    end

    assert_redirected_to bug_histories_path
  end
end
