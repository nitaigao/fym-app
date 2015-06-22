require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "validates format of email" do
    u = User.create(email: "invalidemail", password:"12345678")
    assert_not u.valid?
    assert_equal [:email], u.errors.keys
  end
end
