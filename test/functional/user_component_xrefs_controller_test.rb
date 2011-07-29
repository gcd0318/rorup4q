require 'test_helper'

class UserComponentXrefsControllerTest < ActionController::TestCase
  setup do
    @user_component_xref = user_component_xrefs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_component_xrefs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_component_xref" do
    assert_difference('UserComponentXref.count') do
      post :create, :user_component_xref => @user_component_xref.attributes
    end

    assert_redirected_to user_component_xref_path(assigns(:user_component_xref))
  end

  test "should show user_component_xref" do
    get :show, :id => @user_component_xref.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @user_component_xref.to_param
    assert_response :success
  end

  test "should update user_component_xref" do
    put :update, :id => @user_component_xref.to_param, :user_component_xref => @user_component_xref.attributes
    assert_redirected_to user_component_xref_path(assigns(:user_component_xref))
  end

  test "should destroy user_component_xref" do
    assert_difference('UserComponentXref.count', -1) do
      delete :destroy, :id => @user_component_xref.to_param
    end

    assert_redirected_to user_component_xrefs_path
  end
end
