class SessionsController < ApplicationController
  def new
    @email = ""  
  end

  def create
    user = User.find_or_create_by(email: new_session_params[:email])
    user.new_token!
    UserTokenMailer.login_email(user).deliver_now
  end

  def destroy
    sign_out()
    redirect_to(new_session_path)
  end

  private

  def new_session_params
    params.permit(:email)
  end
end
