class User < ApplicationRecord

  has_secure_password
  has_many :projects, through: :userprojects
  has_many :timers
  has_many :userprojects

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :role, presence: true
  has_many :admin_projects

  def admin_projects
    if role == "admin"
      my_projects = Project.where(owner_id: id)
    end
    puts(my_projects)
    my_projects
  end



end
