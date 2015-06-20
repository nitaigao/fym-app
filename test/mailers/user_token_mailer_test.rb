require 'test_helper'

class UserTokenMailerTest < ActionMailer::TestCase
  test "sends token to the user" do
    user = users(:one)
    email = UserTokenMailer.login_email(user).deliver_now
    assert_not ActionMailer::Base.deliveries.empty?
    assert_equal ["login@mailed.cf"], email.from
    assert_equal [user.email], email.to
    assert_equal "Mailed Login", email.subject
    assert email.body =~ /Login Here: https?:\/\/[A-Za-z.:0-9]*\/[a-z]*\?token=[a-zA-Z0-9-]*/
  end
end
