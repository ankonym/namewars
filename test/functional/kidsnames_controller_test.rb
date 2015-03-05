require 'test_helper'

class KidsnamesControllerTest < ActionController::TestCase
  setup do
    @kidsname = kidsnames(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kidsnames)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kidsname" do
    assert_difference('Kidsname.count') do
      post :create, kidsname: { gender: @kidsname.gender, name: @kidsname.name, rank: @kidsname.rank, score: @kidsname.score }
    end

    assert_redirected_to kidsname_path(assigns(:kidsname))
  end

  test "should show kidsname" do
    get :show, id: @kidsname
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kidsname
    assert_response :success
  end

  test "should update kidsname" do
    put :update, id: @kidsname, kidsname: { gender: @kidsname.gender, name: @kidsname.name, rank: @kidsname.rank, score: @kidsname.score }
    assert_redirected_to kidsname_path(assigns(:kidsname))
  end

  test "should destroy kidsname" do
    assert_difference('Kidsname.count', -1) do
      delete :destroy, id: @kidsname
    end

    assert_redirected_to kidsnames_path
  end
end
