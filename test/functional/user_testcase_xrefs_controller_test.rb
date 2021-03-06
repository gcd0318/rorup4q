require 'test_helper'

class UserTestcaseXrefsControllerTest < ActionController::TestCase
  setup do
    @user_testcase_xref = user_testcase_xrefs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_testcase_xrefs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_testcase_xref" do
    assert_difference('UserTestcaseXref.count') do
      post :create, :user_testcase_xref => @user_testcase_xref.attributes
    end

    assert_redirected_to user_testcase_xref_path(assigns(:user_testcase_xref))
  end

  test "should show user_testcase_xref" do
    get :show, :id => @user_testcase_xref.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @user_testcase_xref.to_param
    assert_response :success
  end

  test "should update user_testcase_xref" do
    put :update, :id => @user_testcase_xref.to_param, :user_testcase_xref => @user_testcase_xref.attributes
    assert_redirected_to user_testcase_xref_path(assigns(:user_testcase_xref))
  end

  test "should destroy user_testcase_xref" do
    assert_difference('UserTestcaseXref.count', -1) do
      delete :destroy, :id => @user_testcase_xref.to_param
    end

    assert_redirected_to user_testcase_xrefs_path
  end
end
