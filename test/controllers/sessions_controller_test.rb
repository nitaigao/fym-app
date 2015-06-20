require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "redirect to login if an invalid token is presented" do
    get :index, token: "bla"
    assert_redirected_to new_session_path
  end

  test "redirect to addresses if a valid token is presented" do
    user = users(:one)
    get :index, token: user[:encrypted_token]
    assert_redirected_to :addresses
  end
end
