class ProjectsController < ApplicationController
  before_action :require_user, except: [:index]
  before_action :require_admin, only: [:new, :create, :assign_user, :invite_user_to_project, :invite_client_to_projects]

  def index
    if current_user&.role == "admin"
      @admin_projects = current_user.admin_projects
      @developers = User.where(role: "developer")
      #future view with this name in views/projects
      render :admin_dashboard
    elsif current_user&.role == "developer"
      @developerprojects = current_user.projects
      #future view with this name in views/projects
      render :developer_dashboard
    elsif current_user&.role == "client"
      @client_projects = current_user.client_projects
      render :client_dashboard
    else
      render :marketing_front_page
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.owner = current_user
    @client = User.find_or_initialize_by(username: params[:project][:client_name].upcase)
    @client.update(email: params[:project][:client_email], password: SecureRandom.hex(10), role: "client")
    @project.client = @client
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

  def invite_client_to_projects
    @client = User.find(params[:client_id])
    Invite.create(project_id: @client.client_projects.first.id, email: @client.email)
    ProjectAssignmentMailer.invite_client_to_projects(@client.email, current_user, Project.find(@client.client_projects.first.id), @client).deliver
  end


  def invite_user_to_project
    Invite.create(project_id: params[:project_id], email: params[:email])
    ProjectAssignmentMailer.invite_user_to_project(params[:email], current_user, Project.find(params[:project_id])).deliver
    redirect_back(fallback_location: root_path)
  end


  private

  def project_params
    params.require(:project).permit(:title, :summary, :estimated_time, :owner_id, :client_id, :client_email, :client_name)
  end

  def require_admin
    redirect_back(fallback_location: root_path, flash: {danger: "You don't have permission for that"})unless current_user.role == "admin"
  end
end
