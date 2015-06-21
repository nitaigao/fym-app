class UserTokenMailer < ApplicationMailer
  default from: 'login@mailed.cf'
 
  def login_email(user, url)
    @url = url
    mail(to: user.email, subject: 'Mailed Login')
  end
end
