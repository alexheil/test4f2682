class Artists::MerchPurchasesController < ApplicationController

  before_action :authenticate_artist!, only: [:index, :edit_shipped]
  before_action :authenticate_fan!, except: [:index, :edit_shipped, :update]
  before_action :authenticate_artist_fan, only: :update
  before_action :set_artist, only: :index
  before_action :correct_artist, only: :index
  before_action :correct_purchase_fan, only: :edit


  def index
    @purchases = ArtistMerchPurchase.all
  end

  def create
    @purchase = ArtistMerchPurchase.new(purchase_params)
    @merch = ArtistMerch.find(params[:id])
    @artist = Artist.find(@merch.artist_id)
    @fan = current_fan

    @purchase.artist_id = @artist.id
    @purchase.merch_name = @merch.merch_name
    @purchase.base_price = @merch.base_price
    @purchase.shipping_price = @merch.shipping_price
    @purchase.fan_id = @fan.id
    @purchase.fan_username = @fan.username

    if @purchase.save
      redirect_to edit_artist_merch_purchase_path(@purchase)
    else
      redirect_to (:back)
    end
  end

  def edit
    @purchase = ArtistMerchPurchase.find(params[:id])
    @merch = ArtistMerch.find(@purchase.artist_merch_id)
    @artist = Artist.find(@merch.artist_id)
  end

  def edit_shipped
    @purchase = ArtistMerchPurchase.find(params[:id])
    @merch = ArtistMerch.find(@purchase.artist_merch_id)
    @artist = Artist.find(@merch.artist_id)
  end

  def update
    @purchase = ArtistMerchPurchase.find(params[:id])
    @merch = ArtistMerch.find(@purchase.artist_merch_id)
    @artist = Artist.find(@merch.artist_id)
    if fan_signed_in? && @purchase.update_attributes(purchase_params)
      redirect_to artist_path(@artist)
    elsif artist_signed_in? && @purchase.update_attributes(purchase_params)
      redirect_to artist_merch_transactions_path(current_artist)
    else
      render 'edit'
    end
  end

  def destroy
    ArtistMerchPurchase.find(params[:id]).destroy
    redirect_to root_url
  end

  private

    def purchase_params
      params.require(:artist_merch_purchase).permit(:artist_id, :artist_merch_id, :quantity, :pay_your_own_price, :complete_price, :full_name, :street_address, :city, :state, :country, :zip_code, :is_shipped)
    end

    def set_artist
      @artist = current_artist
    end

    def correct_artist
      @artist = current_artist
      redirect_to artist_path if @artist != Artist.find(params[:id])
    end

    def correct_purchase_fan
        @purchase = ArtistMerchPurchase.find(params[:id])
        redirect_to artist_path(@purchase.artist_id) if @purchase.fan_id != current_fan.id
    end

    def authenticate_artist_fan
      authenticate_artist! unless fan_signed_in? || authenticate_fan! unless artist_signed_in?
    end

end
