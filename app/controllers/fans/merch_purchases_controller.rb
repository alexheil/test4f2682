class Fans::MerchPurchasesController < ApplicationController

  before_action :authenticate_fan!
  before_action :correct_fan


  def index
    @fan = current_fan
    @purchases = ArtistMerchPurchase.all
  end

  private

    def correct_fan
      @fan = current_fan
      redirect_to fan_path if @fan != Fan.find(params[:id])
    end

end
