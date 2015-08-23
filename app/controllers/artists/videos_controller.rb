class Artists::VideosController < ApplicationController

  before_action :authenticate_artist!, except: :index
  before_action :correct_artist, except: [:index, :edit, :update, :destroy]
  before_action :set_artist, except: :index
  before_action :correct_video_artist, only: [:edit, :update, :destroy]

  def index
    @artist = Artist.find(params[:id])
    @videos = ArtistVideo.all
  end

  def select
    @videos = ArtistVideo.all
  end

  def new
    @video = ArtistVideo.new
  end

  def create
    @video = @artist.artist_videos.build(video_params)
    if @video.save
      redirect_to current_artist
    else
      render 'new'
    end
  end

  def edit
    @video = ArtistVideo.find(params[:id])
  end

  def update
    @video = ArtistVideo.find(params[:id])
    if @video.update_attributes(video_params)
      redirect_to select_artist_video_path(current_artist)
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @video = ArtistVideo.find(params[:id])
    if @video.destroy
      redirect_to select_artist_video_path(current_artist)
    else
      redirect_to select_artist_video_path(current_artist)
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

    def correct_video_artist
      @video = ArtistVideo.find(params[:id])
      redirect_to artist_path(@video.artist_id) if @video.artist_id != current_artist.id
    end

    def video_params
      params.require(:artist_video).permit(:artist_id, :video_title, :video_description, :youtube_video_url)
    end

end
