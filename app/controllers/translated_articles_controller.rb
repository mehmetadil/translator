class TranslatedArticlesController < ApplicationController
  before_action :set_translated_article, only: [:show]

  def show; end

  private

  def set_translated_article
    @translated_article = TranslatedArticle.find(params[:id])
  end
end
