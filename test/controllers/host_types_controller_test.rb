require 'test_helper'

class HostTypesControllerTest < ActionController::TestCase
  setup do
    @host_type = host_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:host_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create host_type" do
    assert_difference('HostType.count') do
      post :create, host_type: { description: @host_type.description, icon: @host_type.icon, name: @host_type.name }
    end

    assert_redirected_to host_type_path(assigns(:host_type))
  end

  test "should show host_type" do
    get :show, id: @host_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @host_type
    assert_response :success
  end

  test "should update host_type" do
    patch :update, id: @host_type, host_type: { description: @host_type.description, icon: @host_type.icon, name: @host_type.name }
    assert_redirected_to host_type_path(assigns(:host_type))
  end

  test "should destroy host_type" do
    assert_difference('HostType.count', -1) do
      delete :destroy, id: @host_type
    end

    assert_redirected_to host_types_path
  end
end
