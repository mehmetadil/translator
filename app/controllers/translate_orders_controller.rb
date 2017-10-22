class TranslateOrdersController < ApplicationController
  before_action :set_translate_order, only: [:show]
  before_action :set_offers, only: [:show]
  before_action :set_article, only: [:article_translate_orders]

  def show
  end

  def create
    @translate_order = TranslateOrder.new(translate_order_params)

    if @translate_order.save
      redirect_to article_path(params[:translate_order][:article_id])
    else
      redirect_to article_path(params[:translate_order][:article_id])
    end
  end

  def article_translate_orders
    @translate_orders = @article.translate_orders
  end

  private

  def translate_order_params
    params.require(:translate_order).permit(:title, :description, :price, :target_language_id, :source_language_id, :user_id, :article_id)
  end

  def set_translate_order
    @translate_order = TranslateOrder.find(params[:id])
  end

  def set_offers
    @offers = @translate_order.offers
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
