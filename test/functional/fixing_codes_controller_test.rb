require 'test_helper'

class FixingCodesControllerTest < ActionController::TestCase
  setup do
    @fixing_code = fixing_codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fixing_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fixing_code" do
    assert_difference('FixingCode.count') do
      post :create, :fixing_code => @fixing_code.attributes
    end

    assert_redirected_to fixing_code_path(assigns(:fixing_code))
  end

  test "should show fixing_code" do
    get :show, :id => @fixing_code.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @fixing_code.to_param
    assert_response :success
  end

  test "should update fixing_code" do
    put :update, :id => @fixing_code.to_param, :fixing_code => @fixing_code.attributes
    assert_redirected_to fixing_code_path(assigns(:fixing_code))
  end

  test "should destroy fixing_code" do
    assert_difference('FixingCode.count', -1) do
      delete :destroy, :id => @fixing_code.to_param
    end

    assert_redirected_to fixing_codes_path
  end
end
