require 'test_helper'

class AddressesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @user = users(:one)
    @address = addresses(:one)
    sign_in(@user)
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

    assert_redirected_to root_path
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
    assert_redirected_to root_path
  end

  test "should destroy address" do
    assert_difference('Address.count', -1) do
      delete :destroy, id: @address
    end

    assert_redirected_to root_path
  end

  test "json should return unauthorized if not logged in" do
    sign_out(@user)
    post :create, address: {  }, format: :json
    assert_response :unauthorized
  end

  test "json should return the new email" do
    post :create, address: { name: "Test Address"  }, format: :json
    assert_response :success
    assert_not response.body["email"].blank?
  end
end
