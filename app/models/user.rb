class User < ApplicationRecord

  has_secure_password
  has_many :projects, through: :userprojects
  has_many :timers
  has_many :userprojects

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :role, presence: true


  def admin_projects
    if role == "admin"
      my_projects = Project.where(owner_id: id)
    end
    puts(my_projects)
    my_projects
  end

  def week_hours
    (timers.where(created_at: Date.today.at_beginning_of_week(:sunday).beginning_of_day..Date.today.end_of_day).sum("value")/3600).round(2)
  end

  def overtime?
    week_hours > 40 ? true : false
  end



end
