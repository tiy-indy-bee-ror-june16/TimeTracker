class ProjectsController < ApplicationController
  before_action :require_user, except: [:index]
  before_action :require_admin, only: [:new, :create, :assign_user]

  def index
    if current_user&.role == "admin"
      @projects = admin_projects.all
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

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save!
      render :admin_dashboard
    else
      render json: @project.errors
    end
  end

  def assign_user
    #maybe most of this goes in the model?
    @user = User.find(params[:user])
    @user.projects << Project.find(params[:project])
  end


  private

  def project_params
    params.require(:project).permit(:title, :summary, :estimated_time, :owner_id)
  end

  def require_admin
    redirect_back(fallback_location: root_path, flash: {danger: "You don't have permission for that"})unless current_user.role == "Admin"
  end
end
