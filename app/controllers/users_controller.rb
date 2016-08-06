class UsersController < ApplicationController

  before_action :require_user, only: [:show]

   def new
     if params[:project_id]
       Invite.create(project_id: params[:project_id], email: params[:email])
     @user = User.new
   end

   def create
     @user = User.new(user_params)
     if @user.save
       session[:username] = @user.username
       redirect_to root_path
     else
       flash[:danger] = "Invalid Information"
     end
   end

   def show
     @user = User.find(id: params[:id])
     @timers = @user.timers.where(project_id: params[:project_id])
   end

   private

   def user_params
     params.require(:user).permit(:password, :username, :email)
   end

end
