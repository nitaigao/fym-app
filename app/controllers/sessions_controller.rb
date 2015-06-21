class SessionsController < ApplicationController
  def index
    if (token = params[:token]).blank?
      redirect_to new_session_path 
    else
      user = User.find_by(encrypted_token: token)
      if user
        sign_in(user)
        redirect_to root_path, params.except(:token, :action, :controller)
      else
        redirect_to new_session_path
      end
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_or_initialize_by(email: email)
    if @user.save
      @user.new_token!
      url = url_for controller: :sessions, token: @user.encrypted_token
      UserTokenMailer.login_email(@user, url).deliver_now
      u, @domain, @tld = email.match(/([a-zA-Z0-9._%+-]+)@([a-zA-Z0-9.-]+).(.[a-zA-Z]{2,4})/).captures
      @host = "#{@domain}.#{@tld}"
    else
      render :new
    end
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
