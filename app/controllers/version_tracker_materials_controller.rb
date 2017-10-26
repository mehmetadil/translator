class VersionTrackerMaterialsController < ApplicationController
  before_action :set_version_tracker_material, only: [:download_material]

  def show
    @version_tracker_materials = VersionTrackerMaterial.where(version_tracker_id: params[:id])
  end

  def download_material
    send_file @version_tracker_material.material.path
  end

  private

  def set_version_tracker_material
    @version_tracker_material = VersionTrackerMaterial.find(params[:id])
  end
end
