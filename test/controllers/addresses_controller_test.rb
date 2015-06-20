require 'test_helper'

class AddressesControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @address = addresses(:one)
    cookies[:sign_in] = @user.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:addresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create address" do
    assert_difference('Address.count') do
      post :create, address: {  }
    end

    assert_redirected_to addresses_path
  end

  test "should show address" do
    get :show, id: @address
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @address
    assert_response :success
  end

  test "should update address" do
    patch :update, id: @address, address: {  }
    assert_redirected_to address_path(assigns(:address))
  end

  test "should destroy address" do
    assert_difference('Address.count', -1) do
      delete :destroy, id: @address
    end

    assert_redirected_to addresses_path
  end
  
  test "redirect to login if an invalid token is presented" do
    get :index, token: "bla"
    assert_redirected_to new_session_path
  end
end
