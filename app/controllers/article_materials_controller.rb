class ArticleMaterialsController < ApplicationController
  before_action :set_article_material, only: [:download_material]
  before_action :set_article, only: [:materials]

  def materials
    @article_materials = @article.article_materials
  end

  def download_material
    send_file @article_material.material.path
  end

  private

  def set_article_material
    @article_material = ArticleMaterial.find(params[:id])
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
