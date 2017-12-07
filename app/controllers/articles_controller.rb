class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :set_languages
  before_action :authenticate_user!, except: %i[index show]
  before_action :user_have_alter_permissions?, only: %i[edit update destroy]
  before_action :set_offers, only: [:show]
  before_action :set_translate_orders, only: [:show]
  before_action :set_translated_articles, only: [:show]
  helper_method :article_belongs_to_user?

  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.article_materials.build(article_material_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @article.update_attributes(article_params)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  def myarticles
    @articles = current_user.articles
  end

  private

  def article_params
    params.require(:article).permit(:name, :description, :language_id,
                                    :user_id, tag_ids: [])
  end

  def article_material_params
    params.require(:article)
          .permit(article_material:
                  %i[description material])[:article_material]
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def set_languages
    @languages = Language.all
  end

  def set_offers
    # @offers = @article.offers.order('created_at DESC')
  end

  def set_translate_orders
    @translate_orders = TranslateOrder.where(article_id:
                                          params[:id]).order('created_at DESC')
  end

  def set_translated_articles
    @translated_articles = @article.translated_articles
  end

  def article_belongs_to_user?
    user_signed_in? && @article.belongs_to_user?(current_user)
  end

  def user_have_alter_permissions?
    redirect_back(fallback_location: articles_path) unless article_belongs_to_user?
  end
end
