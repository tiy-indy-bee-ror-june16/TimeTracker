class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def require_user
    unless current_user
     flash[:danger] = "Please login or register"
    end
  end

  def current_user
    if session[:username]
     @current_user ||= User.find_by(username: session[:username])
    end
    @current_user
  end
end
