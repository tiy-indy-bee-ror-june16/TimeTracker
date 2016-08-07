class UsersController < ApplicationController

  before_action :require_user, only: [:show]

   def new
     if params[:project_id]
       @user = User.new
       @project = Project.find(params[:project_id])
     else
       @user = User.new
     end
   end

   def create
     @user = User.new(user_params)
     if params[:project_id] && Invite.where("project_id = ? AND email = ?", params[:project_id], params[:user][:email])
       @user.projects << Project.find(params[:project_id])
       #need to add additional logic to send back message and NOT save if project not found, but still came in with project_id param.
     end
     if @user.save
       session[:username] = @user.username
       redirect_to root_path
     else
       redirect_back(fallback_location: root_path, flash: {danger: "Invalid Information"})
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
