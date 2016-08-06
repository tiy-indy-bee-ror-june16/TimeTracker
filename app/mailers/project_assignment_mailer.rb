class ProjectAssignmentMailer < ApplicationMailer

  def assignment_email(user, current_user)
    @user = user
    @user2 = current_user
    mail( :to => @user.email, :subject => 'You have been assigned a project')
  end

end
