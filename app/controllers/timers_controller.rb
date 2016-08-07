class TimersController < ApplicationController

  def create
    @timer = current_user.timers.create!(
      project_id: params[:project_id],
      value: params[:value]
    )
    @timer.starttimeadjust
    redirect_back(fallback_location: root_path)
  end

  def edit
    @timer = Timer.find(params[:id])
    @timer.value = Time.at(@timer.value).utc.strftime("%H:%M:%S")
  end

  def update
    @timer = Timer.find(params[:id])
    x = DateTime.parse(params[:timer][:value])
    @timer.value = x.hour * 3600 + x.min * 60 + x.sec
    if @timer.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @timer = Timer.find(params[:id])
    @timer.destroy
    redirect_to root_path
  end


end
