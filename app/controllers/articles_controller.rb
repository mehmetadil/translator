class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :set_languages  
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_if_acticle_belongs_to_user?, only: [:edit, :update, :destroy]
  before_action :set_offers, only: [:show]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.article_materials.build(article_material_params)
    if @article.save
      redirect_to myarticles_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if  @article.update_attributes(article_params)
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
    @articles = Article.where(user_id: current_user.id)
  end

  def check_if_acticle_belongs_to_user?
    redirect_back(fallback_location: articles_path) unless @article.user_id == current_user.id 
  end

  private

  def article_params
    params.require(:article).permit(:name, :description, :language_id, :user_id)
  end

  def article_material_params
    params.require(:article).permit(article_material: [:description, :material])[:article_material]
  end
  
  def set_article
    @article = Article.find(params[:id])
  end

  def set_languages
    @languages = Language.all
  end

  def set_offers
    #@offers = @article.offers.order("created_at DESC") 
  end
end
