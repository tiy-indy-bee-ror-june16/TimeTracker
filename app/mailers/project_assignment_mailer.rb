class ProjectAssignmentMailer < ApplicationMailer

  def assignment_email(user, admin, project_title)
    @user = user
    @admin = admin
    @project_title = project_title
    mail( :to => @user.email, :subject => 'You have been assigned a project')
  end

  def invite_user_to_project(email, admin, project)
    @email = email
    @admin = admin
    @project = project
    mail(to: @email, :subject => "You have been invited to join #{@admin.username}'s project")
  end

  def invite_client_to_projects(email, admin, project, client)
    @email = email
    @admin = admin
    @project = project
    @client = client
    mail(to: @email, :subject => "Monitor Your Projects On TimeTrackr")
  end
end
