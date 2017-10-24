class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :accept_offer]
  before_action :set_offer_translate_order, only: [:accept_offer]

  def show

  end

  def myoffers
    @offers = current_user.offers
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      redirect_to translate_order_path(@offer.translate_order_id)
    else
      redirect_to translate_order_path(@offer.translate_order_id)
    end
  end

  def accept_offer # TODO set translated_article_id
    @offer.accepted!
    @task = Task.new(translator_id: @offer.translator_id, offer_id: @offer.id, source_language_id: @translate_order.source_language_id, target_language_id: @translate_order.target_language_id)
    
    unless @translated_article = TranslatedArticle.check_if_translated_article_exist?(@task.target_language_id)
      @translated_article = TranslatedArticle.create(language_id: @task.target_language_id, article_id: @offer.translate_order.article_id)
    end
    @task.update_attribute(:translated_article_id, @translated_article.id)

    if @task.save
      redirect_to translate_order_path(@offer.translate_order_id)
    else
      redirect_to translate_order_path(@offer.translate_order_id)
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:description, :price, :translation_time, :article_id, :translator_id, :translate_order_id)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def set_offer_translate_order
    @translate_order = @offer.translate_order
  end
end
