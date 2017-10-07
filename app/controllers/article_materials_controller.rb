class ArticleMaterialsController < ApplicationController
  def show
    @article_materials = ArticleMaterial.where(article_id: params[:id])
  end

  def download_material
    send_file set_download_url
  end

  private

  def set_download_url
    file_folder_id = params[:id]
    file_name = ArticleMaterial.find(params[:id]).material_file_name
    if file_folder_id.to_i  < 10
      file_folder_name = "00" + file_folder_id
    elsif file_folder_id.to_i < 100
      file_folder_name = "0" + file_folder_id
    else
      file_folder_name = file_folder_id
    end 
    "#{Rails.root}" + "/public/system/article_materials/materials/000/000/#{file_folder_name}/original/#{file_name}"
  end
end
