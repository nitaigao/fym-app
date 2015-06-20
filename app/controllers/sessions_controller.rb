class SessionsController < ApplicationController
  def new
    @email = ""  
  end

  def create
    user = User.find_or_create_by(email: email)
    user.new_token!
    UserTokenMailer.login_email(user).deliver_now
    @user, @domain, @tld = email.match(/([a-zA-Z0-9._%+-]+)@([a-zA-Z0-9.-]+).(.[a-zA-Z]{2,4})/).captures
    @host = "#{@domain}.#{@tld}"
  end

  def destroy
    sign_out()
    redirect_to(new_session_path)
  end

  private

  def email 
    new_session_params[:email]
  end

  def new_session_params
    params.permit(:email)
  end
end
