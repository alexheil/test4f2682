class Artists::MerchesController < ApplicationController

  before_action :authenticate_artist!, except: [:index, :show]
  before_action :correct_artist, except: [:index, :show, :edit, :update, :destroy]
  before_action :set_artist, except: [:index, :show]
  before_action :correct_merch_artist, only: [:edit, :update, :destroy]

  def index
    @artist = Artist.find(params[:id])
    @merch = ArtistMerch.all
  end

  def select
    @merch = ArtistMerch.all
  end

  def show
    @merch = ArtistMerch.find(params[:id])
    @artist = Artist.find(@merch.artist_id)
  end

  def new
    @merch = ArtistMerch.new
  end

  def create
    @merch = @artist.artist_merches.build(merch_params)
    if @merch.save
      redirect_to select_artist_merch_path(@artist)
    else
      render 'new'
    end
  end

  def edit
    @merch = ArtistMerch.find(params[:id])
  end

  def update
    @merch = ArtistMerch.find(params[:id])
    if @merch.update_attributes(merch_params)
      redirect_to select_artist_merch_path(@artist)
    else
      render 'new'
    end
  end

  def destroy
    ArtistMerch.find(params[:id]).destroy
    redirect_to select_artist_merch_path(@artist)
  end

  private

    def merch_params
      params.require(:artist_merch).permit(:paypal_email, :about, :merch_name, :merch_description, :base_price, :shipping_price, :total_price, :quantity, :options, :return_policy, :shipping_info, :merch_image)
    end

    def set_artist
      @artist = current_artist
    end

    def correct_artist
      @artist = current_artist
      redirect_to artist_path if @artist != Artist.find(params[:id])
    end

    def correct_merch_artist
      @merch = ArtistMerch.find(params[:id])
      redirect_to artist_path(@merch.artist_id) if @merch.artist_id != current_artist.id
    end

end
