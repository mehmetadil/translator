class VersionTrackersController < ApplicationController
  before_action :set_version_tracker, only: [:show]

  def show
  end

  def create
    @version_tracker = VersionTracker.new(version_tracker_params)
    @version_tracker.version_tracker_materials.build(version_tracker_material_params)
    
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

  def set_version_tracker
    @version_tracker = VersionTracker.find(params[:id])
  end

  def version_tracker_material_params
    params.require(:version_tracker).permit(version_tracker_material: [:description, :material])[:version_tracker_material]
  end
end
