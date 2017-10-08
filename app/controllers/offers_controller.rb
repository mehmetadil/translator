class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :accept_offer]

  def show

  end

  def myoffers
    @offers = Offer.where(translator_id: current_user.id)
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      redirect_to article_path(params[:offer][:article_id])
    else
      redirect_to article_path(params[:offer][:article_id])
    end
  end

  def accept_offer
    binding.pry
    @offer.update_attribute(:status, "Accepted" )
    @task = Task.new(article_id: @offer.article_id, user_id: @offer.user_id, offer_id: @offer.id, source_language_id: @offer.source_language_id, target_language_id: @offer.target_language_id)
    if @task.save
      binding.pry
      redirect_to article_path(@offer.article_id)
    else
      binding.pry
      redirect_to article_path(@offer.article_id)
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:description, :price, :translation_time, :article_id, :user_id, :source_language_id, :target_language_id)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end
end
