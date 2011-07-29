require 'test_helper'

class UserBugXrefsControllerTest < ActionController::TestCase
  setup do
    @user_bug_xref = user_bug_xrefs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_bug_xrefs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_bug_xref" do
    assert_difference('UserBugXref.count') do
      post :create, :user_bug_xref => @user_bug_xref.attributes
    end

    assert_redirected_to user_bug_xref_path(assigns(:user_bug_xref))
  end

  test "should show user_bug_xref" do
    get :show, :id => @user_bug_xref.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @user_bug_xref.to_param
    assert_response :success
  end

  test "should update user_bug_xref" do
    put :update, :id => @user_bug_xref.to_param, :user_bug_xref => @user_bug_xref.attributes
    assert_redirected_to user_bug_xref_path(assigns(:user_bug_xref))
  end

  test "should destroy user_bug_xref" do
    assert_difference('UserBugXref.count', -1) do
      delete :destroy, :id => @user_bug_xref.to_param
    end

    assert_redirected_to user_bug_xrefs_path
  end
end
