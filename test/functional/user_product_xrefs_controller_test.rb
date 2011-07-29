require 'test_helper'

class UserProductXrefsControllerTest < ActionController::TestCase
  setup do
    @user_product_xref = user_product_xrefs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_product_xrefs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_product_xref" do
    assert_difference('UserProductXref.count') do
      post :create, :user_product_xref => @user_product_xref.attributes
    end

    assert_redirected_to user_product_xref_path(assigns(:user_product_xref))
  end

  test "should show user_product_xref" do
    get :show, :id => @user_product_xref.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @user_product_xref.to_param
    assert_response :success
  end

  test "should update user_product_xref" do
    put :update, :id => @user_product_xref.to_param, :user_product_xref => @user_product_xref.attributes
    assert_redirected_to user_product_xref_path(assigns(:user_product_xref))
  end

  test "should destroy user_product_xref" do
    assert_difference('UserProductXref.count', -1) do
      delete :destroy, :id => @user_product_xref.to_param
    end

    assert_redirected_to user_product_xrefs_path
  end
end
