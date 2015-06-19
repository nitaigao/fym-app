class SessionsController < ApplicationController
  def new
    @email = ""  
  end

  def create
    u = User.find_by!(email: new_session_params[:email])
    u.new_token!
    UserTokenMailer.login_email(u).deliver_now
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
