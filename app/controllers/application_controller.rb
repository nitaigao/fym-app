class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def sign_in(user)
    cookies[:sign_in] = user.id
  end

  def sign_out
    cookies.delete(:sign_in)
  end

  def logged_in
    cookies[:sign_in]
  end

  def current_user
    @current_user = User.find(logged_in)
  end

  def authenticate_user!
    if not logged_in
      redirect_to new_session_path
    end
  end
end
