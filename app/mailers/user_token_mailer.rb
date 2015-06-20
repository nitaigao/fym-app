class UserTokenMailer < ApplicationMailer
  default from: 'login@mailed.cf'
 
  def login_email(user)
    @url = url_for controller: :sessions, token: user.encrypted_token
    mail(to: user.email, subject: 'Mailed Login')
  end
end
