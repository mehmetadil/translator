class ArticleMaterialsController < ApplicationController
  def show
    binding.pry
    @article_materials = ArticleMaterial.where(article_id: params[:id])
  end
end
