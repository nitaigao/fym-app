class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session.delete(:user_id)
  end

  def logged_in
    session[:user_id]
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
