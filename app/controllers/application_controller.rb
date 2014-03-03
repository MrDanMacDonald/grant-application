class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def if_not_user_redirect
    unless request.path == (user_path(current_user.id)) || (grant_application_path(current_user.id))
      redirect_to root_path, notice: "You're not an admin"
    end
  end

  def is_admin?
    User.find(session[:user_id]).is_admin if session[:user_id]
  end

  helper_method :current_user

end