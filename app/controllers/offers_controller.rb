class OffersController < ApplicationController
  before_action :set_offer, only: [:accept_offer]

  def myoffers
    @offers = Offer.where(user_id: current_user.id)
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
    redirect_to article_path(@offer.article_id)
  end

  private

  def offer_params
    params.require(:offer).permit(:description, :price, :translate_time, :article_id, :user_id)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end
end
