class VersionTrackersController < ApplicationController

  def create
    @version_tracker = VersionTracker.new(version_tracker_params)
    
    if @version_tracker.save
      redirect_to task_path(@version_tracker.task_id)
    else
      redirect_to task_path(@version_tracker.task_id)
    end
  end

  private

  def version_tracker_params
    params.require(:version_tracker).permit(:name, :description, :task_id)
  end
end
