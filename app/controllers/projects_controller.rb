class ProjectsController < ApplicationController
  before_action :require_user, except: [:index]
  before_action :require_admin, only: [:new, :create, :assign_user, :invite_user_to_project]

  def index
    if current_user&.role == "admin"
      @admin_projects = current_user.admin_projects
      @developers = User.where(role: "developer")
      #future view with this name in views/projects
      render :admin_dashboard
    elsif current_user&.role == "developer"
      @projects = current_user.projects
      #future view with this name in views/projects
      render :developer_dashboard
    else
      render :marketing_front_page
    end
  end

  def invite_user_to_project
    Invite.create(project_id: params[:project_id], email: params[:email])
    ProjectAssignmentMailer.invite_user_to_project(params[:email], current_user, Project.find(params[:project_id]))
    redirect_back(fallback_location: root_path)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.owner = current_user
    if @project.save!
      redirect_to root_path
    else
      render json: @project.errors
    end
  end

  def assign_user
    #maybe most of this goes in the model?
    @user = User.find(params[:user_id])
    @user.projects << Project.find(params[:project_id])
    ProjectAssignmentMailer.assignment_email(User.find(params[:user_id]), current_user,  Project.find(params[:project_id]).title).deliver_later
    redirect_to root_path
  end


  private

  def project_params
    params.require(:project).permit(:title, :summary, :estimated_time, :owner_id)
  end

  def require_admin
    redirect_back(fallback_location: root_path, flash: {danger: "You don't have permission for that"})unless current_user.role == "admin"
  end
end
