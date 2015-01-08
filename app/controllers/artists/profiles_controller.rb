class Artists::ProfilesController < ApplicationController

  before_action :authenticate_artist!
  before_action :correct_artist
  before_action :set_artist

  def edit
    @profile = ArtistProfile.find_by(params[:artist_id])
  end

  def update
    @profile = ArtistProfile.find_by(params[:artist_id])
    if @profile.update_attributes(profile_params)
      redirect_to current_artist
    else
      redirect_to root_url
    end
  end

  private

    def set_artist
      @artist = current_artist
    end

    def correct_artist
      @artist = current_artist
      if @artist != Artist.find(params[:id])
        redirect_to artist_path
      end
    end

    def profile_params
      params.require(:artist_profile).permit(:biography, :location, :genre, :members, :facebook_url, :twitter_url, :youtube_url, :itunes_url, :amazon_url)
    end

end
