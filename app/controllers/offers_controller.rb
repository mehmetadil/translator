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
      redirect_to translate_order_path(@offer.translate_order_id)
    else
      redirect_to translate_order_path(@offer.translate_order_id)
    end
  end

  def accept_offer
    @task = Task.new(translator_id: @offer.translator_id,
                     offer_id: @offer.id,
                     source_language_id: @translate_order.source_language_id,
                     target_language_id: @translate_order.target_language_id,
                     owner_id: @translate_order.user_id)

    
    # Projenin yapısına göre aşağıdaki bloğa ihtiyaç duyulmayabilir
    unless TranslatedArticle.exist?(@translate_order.article_id, @task.target_language_id)
      @translated_article =
        TranslatedArticle.create(language_id: @task.target_language_id,
                                 article_id: @offer.translate_order.article_id)
    else
      @translated_article = TranslatedArticle.find_by(language_id: @task.target_language_id)
    end

    if @task.update_attribute(:translated_article_id, @translated_article.id)
      #@offer.accepted!
      #Thread.new do
        Zanata::Headless.assign_translator(@translate_order.article.project_id, @task.translator.profile.zanata_username)
      #end
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

  def set_zanata_project_id
    Digest::SHA1.hexdigest (@offer.translate_order.article.name + Time.now.to_s)
  end

  def set_article_file_path
    Rails.root.to_s + '/public' +
      @translate_order.article.article_materials.first.material.url.split('?')[0]
  end
end
