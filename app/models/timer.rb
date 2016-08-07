class Timer < ApplicationRecord
  belongs_to :user
  belongs_to :project

  default_scope { order(created_at: :desc) }
  after_commit :set_project_actual_time



  def starttimeadjust
    self.created_at = self.created_at - self.value
    self.save
  end

  def formatted
    Time.at(self.value).utc.strftime("%H:%M:%S")
  end


private

  def set_project_actual_time
    project.actual_time = project.actual_time
  end

end
