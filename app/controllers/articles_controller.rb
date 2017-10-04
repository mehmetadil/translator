class ArticlesController < ApplicationController
  before_action :set_article , only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

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

    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @article.destroy
    redirect_to :articles_path
  end

  private

  def article_params
    binding.pry
    params.require(:article).permit(:name, :description, :language_id, :user_id)
  end
  
  def set_article
    @article = Article.find(params[:id])
  end
end
