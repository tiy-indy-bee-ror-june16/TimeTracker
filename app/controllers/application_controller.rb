class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def require_user
    redirect_back(fallback_location: root_path, flash: {danger: "Please login or register."}) unless current_user
  end

  def current_user
    if session[:username]
     @current_user ||= User.find_by(username: session[:username])
    end
    @current_user
  end
end
