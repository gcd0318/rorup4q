require 'test_helper'

class UserTrackXrefsControllerTest < ActionController::TestCase
  setup do
    @user_track_xref = user_track_xrefs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_track_xrefs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_track_xref" do
    assert_difference('UserTrackXref.count') do
      post :create, :user_track_xref => @user_track_xref.attributes
    end

    assert_redirected_to user_track_xref_path(assigns(:user_track_xref))
  end

  test "should show user_track_xref" do
    get :show, :id => @user_track_xref.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @user_track_xref.to_param
    assert_response :success
  end

  test "should update user_track_xref" do
    put :update, :id => @user_track_xref.to_param, :user_track_xref => @user_track_xref.attributes
    assert_redirected_to user_track_xref_path(assigns(:user_track_xref))
  end

  test "should destroy user_track_xref" do
    assert_difference('UserTrackXref.count', -1) do
      delete :destroy, :id => @user_track_xref.to_param
    end

    assert_redirected_to user_track_xrefs_path
  end
end
