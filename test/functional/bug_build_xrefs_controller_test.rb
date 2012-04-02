require 'test_helper'

class BugBuildXrefsControllerTest < ActionController::TestCase
  setup do
    @bug_build_xref = bug_build_xrefs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bug_build_xrefs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bug_build_xref" do
    assert_difference('BugBuildXref.count') do
      post :create, :bug_build_xref => @bug_build_xref.attributes
    end

    assert_redirected_to bug_build_xref_path(assigns(:bug_build_xref))
  end

  test "should show bug_build_xref" do
    get :show, :id => @bug_build_xref.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bug_build_xref.to_param
    assert_response :success
  end

  test "should update bug_build_xref" do
    put :update, :id => @bug_build_xref.to_param, :bug_build_xref => @bug_build_xref.attributes
    assert_redirected_to bug_build_xref_path(assigns(:bug_build_xref))
  end

  test "should destroy bug_build_xref" do
    assert_difference('BugBuildXref.count', -1) do
      delete :destroy, :id => @bug_build_xref.to_param
    end

    assert_redirected_to bug_build_xrefs_path
  end
end
