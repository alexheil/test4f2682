class Artists::ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.includes(:artist_microposts).find(params[:id])
    @micropost = ArtistMicropost.new
  end

  def followers
    @artist = Artist.find(params[:id])
  end

end

