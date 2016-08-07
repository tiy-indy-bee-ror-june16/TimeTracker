class Timer < ApplicationRecord
  belongs_to :user
  belongs_to :project
  after_commit :set_project_actual_time


private

  def set_project_actual_time
    project.actual_time = project.actual_time
  end

end
