require 'test_helper'

class TestcaseBugXrefsControllerTest < ActionController::TestCase
  setup do
    @testcase_bug_xref = testcase_bug_xrefs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:testcase_bug_xrefs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create testcase_bug_xref" do
    assert_difference('TestcaseBugXref.count') do
      post :create, :testcase_bug_xref => @testcase_bug_xref.attributes
    end

    assert_redirected_to testcase_bug_xref_path(assigns(:testcase_bug_xref))
  end

  test "should show testcase_bug_xref" do
    get :show, :id => @testcase_bug_xref.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @testcase_bug_xref.to_param
    assert_response :success
  end

  test "should update testcase_bug_xref" do
    put :update, :id => @testcase_bug_xref.to_param, :testcase_bug_xref => @testcase_bug_xref.attributes
    assert_redirected_to testcase_bug_xref_path(assigns(:testcase_bug_xref))
  end

  test "should destroy testcase_bug_xref" do
    assert_difference('TestcaseBugXref.count', -1) do
      delete :destroy, :id => @testcase_bug_xref.to_param
    end

    assert_redirected_to testcase_bug_xrefs_path
  end
end
