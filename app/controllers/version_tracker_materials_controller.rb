class VersionTrackerMaterialsController < ApplicationController
  def show
    @version_tracker_materials = VersionTrackerMaterial.where(version_tracker_id: params[:id])
  end

  def download_material
    send_file download_url
  end

  private

  def download_url
    file_folder_id = params[:id]
    file_name = VersionTrackerMaterial.find(params[:id]).material_file_name
    if file_folder_id.to_i  < 10
      file_folder_name = "00" + file_folder_id
    elsif file_folder_id.to_i < 100
      file_folder_name = "0" + file_folder_id
    else
      file_folder_name = file_folder_id
    end 
    "#{Rails.root}" + "/public/system/version_tracker_materials/materials/000/000/#{file_folder_name}/original/#{file_name}"
  end
end
