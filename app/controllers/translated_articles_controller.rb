class TranslatedArticlesController < ApplicationController
  before_action :set_translated_article, only: [:show]
  before_action :set_article, only: [:translated_languages]
  def show; end

  def translated_languages
    @translated_articles = @article.translated_articles
  end

  private

  def set_translated_article
    @translated_article = TranslatedArticle.find(params[:id])
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
