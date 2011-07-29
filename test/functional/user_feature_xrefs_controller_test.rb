require 'test_helper'

class UserFeatureXrefsControllerTest < ActionController::TestCase
  setup do
    @user_feature_xref = user_feature_xrefs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_feature_xrefs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_feature_xref" do
    assert_difference('UserFeatureXref.count') do
      post :create, :user_feature_xref => @user_feature_xref.attributes
    end

    assert_redirected_to user_feature_xref_path(assigns(:user_feature_xref))
  end

  test "should show user_feature_xref" do
    get :show, :id => @user_feature_xref.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @user_feature_xref.to_param
    assert_response :success
  end

  test "should update user_feature_xref" do
    put :update, :id => @user_feature_xref.to_param, :user_feature_xref => @user_feature_xref.attributes
    assert_redirected_to user_feature_xref_path(assigns(:user_feature_xref))
  end

  test "should destroy user_feature_xref" do
    assert_difference('UserFeatureXref.count', -1) do
      delete :destroy, :id => @user_feature_xref.to_param
    end

    assert_redirected_to user_feature_xrefs_path
  end
end
