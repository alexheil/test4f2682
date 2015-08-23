class Artists::MicropostsController < ApplicationController

  before_action :authenticate_artist!
  before_action :set_artist
  before_action :correct_artist, only: :create
  before_action :correct_micropost_artist, only: :destroy

  def create
    @micropost = @artist.artist_microposts.build(micropost_params)
    if @micropost.save
      redirect_to @artist
    else
      redirect_to root_url
    end
  end

  def destroy
    ArtistMicropost.find(params[:id]).destroy
    redirect_to (:back)
  end

  private

    def set_artist
      @artist = current_artist
    end

    def correct_artist
      @artist = current_artist
      redirect_to artist_path if @artist != Artist.find(params[:id])
    end

    def correct_micropost_artist
      @micropost = ArtistMicropost.find(params[:id])
      redirect_to artist_path(@micropost.artist_id) if @micropost.artist_id != current_artist.id
    end

    def micropost_params
      params.require(:artist_micropost).permit(:artist_id, :content, :upvotes, :downvotes, :total_votes)
    end

end
