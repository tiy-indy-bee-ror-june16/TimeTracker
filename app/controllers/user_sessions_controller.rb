class UserSessionsController < ApplicationController
  before_action :require_user, only: [:destroy]

 def create
   @user = User.find_by(username: params[:username])
   if @user
     if @user.authenticate(params[:password])
       session[:username] = @user.username
       redirect_to root_path
     else
       redirect_to root_path, flash: {danger: "Incorrect Password or Username"}
     end
   else
      redirect_to root_path, flash: {danger: "Incorrect Password or Username"}
   end
 end

 def destroy
   session[:username] = nil
   redirect_to root_path
 end

end
