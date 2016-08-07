class UsersController < ApplicationController
  before_action :require_user, only: [:show]

#client messages to admins will only happen in messages controller. There's a messages index that shows all your messsages.
   def new
     if params[:project_id]
       @user = User.new(email: params[:email])
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

# This is how clients get made.

   def edit
     @user = User.find(params[:id])
   end

   def update
     @user = User.find(params[:id])
     if params[:project_id] && Invite.where("project_id = ? AND email = ?", params[:project_id], params[:user][:email])
       if @user.update(user_params)
         session[:username] = @user.username
         redirect_to root_path
       end
     end
     redirect_back(fallback_location: root_path, flash: {danger: "Invalid Information"})
   end

   private

   def user_params
     params.require(:user).permit(:password, :username, :email)
   end

end
