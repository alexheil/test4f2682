class Artists::ProfilesController < ApplicationController

  before_action :authenticate_artist!
  before_action :correct_artist
  before_action :set_artist

  def edit
    @profile = @artist.artist_profile
  end

  def update
    @profile = @artist.artist_profile
    if @profile.update_attributes(profile_params)
      redirect_to current_artist
    else
      render 'edit'
    end
  end

  private

    def set_artist
      @artist = current_artist
    end

    def correct_artist
      @artist = current_artist
      redirect_to artist_path if @artist != Artist.find(params[:id])
    end

    def profile_params
      params.require(:artist_profile).permit(:biography, :location, :genre, :members, :facebook_url, :twitter_url, :youtube_url, :itunes_url, :amazon_url, :google_play_url, :record_label, :cover_image, :profile_image)
    end

end
