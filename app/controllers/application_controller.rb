class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_user

  end

  def current_user

  end

end
