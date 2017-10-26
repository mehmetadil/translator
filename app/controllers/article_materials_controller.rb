class ArticleMaterialsController < ApplicationController
  before_action :set_article_material, only: [:download_material]

  def show
    @article_materials = ArticleMaterial.where(article_id: params[:id])
  end

  def download_material
    send_file @article_material.material.path
  end

  private

  def set_article_material
    @article_material = ArticleMaterial.find(params[:id])
  end
end
