class TimersController < ApplicationController

  def create
    @timer = current_user.timers.create!(
      project_id: params[:project_id],
      value: params[:value]
    )
    @timer.starttimeadjust
    redirect_back(fallback_location: root_path)
  end

end
