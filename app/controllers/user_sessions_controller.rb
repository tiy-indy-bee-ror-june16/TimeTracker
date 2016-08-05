class UserSessionsController < ApplicationController
  before_action :require_user, only: [:destroy]

  # Need template file name for user page we want to render on login
  def create
    @user = User.find_by(username: params[:username])
    if @user
      if @user.authenticate(params[:password])
        session[:username] = @user.username
        redirect_to root_path
      else
        flash[:danger] = "Incorrect Password"
      end
    else
      flash[:danger] = "User Not Found"
    end
  end

  def destroy
    session[:username] = nil
    redirect_to root_path
  end

end
