require 'test_helper'

class UserTokenMailerTest < ActionMailer::TestCase
  test "sends token to the user" do
    user = users(:one)
    url = "http://www.testdomain.com/sessions/auth?token=sometoken"
    email = UserTokenMailer.login_email(user, url).deliver_now
    assert_not ActionMailer::Base.deliveries.empty?
    assert_equal ["login@mailed.cf"], email.from
    assert_equal [user.email], email.to
    assert_equal "Mailed Login", email.subject
    assert email.body =~ /Login Here: #{Regexp.escape(url)}/
  end
end
