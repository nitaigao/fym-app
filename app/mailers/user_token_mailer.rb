class UserTokenMailer < ApplicationMailer
  default from: 'login@mailed.cf'
 
  def login_email(user)
    @url  = "http://localhost:3000/addresses?token=#{user.encrypted_token}"
    mail(to: @ser.email, subject: 'Login to mailed.cf')
  end
end
