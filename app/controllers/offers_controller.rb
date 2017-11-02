class OffersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_offer, only: %i[show accept_offer]
  before_action :set_offer_translate_order, only: [:accept_offer]

  def show; end

  def myoffers
    @offers = current_user.offers
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      @offer.notify :users, key: 'offer.create', notifier: @offer.translator
      redirect_to translate_order_path(@offer.translate_order_id)
    else
      redirect_to translate_order_path(@offer.translate_order_id)
    end
  end

  def accept_offer
    @offer.accepted!
    @offer.notify :users, key: 'offer.accepted', notifier: @offer.translate_order.user
    @task = Task.new(translator_id: @offer.translator_id,
                     owner_id: @offer.translate_order.user
                     offer_id: @offer.id,
                     source_language_id: @translate_order.source_language_id,
                     target_language_id: @translate_order.target_language_id)

    unless @translated_article = TranslatedArticle.check_if_translated_article_exist?(@task.target_language_id)
      @translated_article =
        TranslatedArticle.create(language_id: @task.target_language_id,
                                 article_id: @offer.translate_order.article_id)
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
    params.require(:offer).permit(:description, :price, :translation_time,
                                  :article_id, :translator_id, :translate_order_id)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def set_offer_translate_order
    @translate_order = @offer.translate_order
  end
end
