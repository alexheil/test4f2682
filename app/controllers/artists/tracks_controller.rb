class Artists::TracksController < ApplicationController

  before_action :authenticate_artist!, except: :show
  before_action :correct_album_artist, only: [:new, :create]
  before_action :set_artist, except: :show
  before_action :correct_track_artist, only: [:edit, :update, :destroy]

  def show
    @track = ArtistTrack.find(params[:id])
    @album = ArtistAlbum.find(@track.artist_album_id)
    @artist = Artist.find(@track.artist_id)
  end

  def new
    @album = ArtistAlbum.find(params[:id])
    @track = ArtistTrack.new
  end

  def create
    @album = ArtistAlbum.find(params[:id])
    @artist = Artist.find(@album.artist_id)
    @track = @album.artist_tracks.build(track_params)

    @track.artist_id = @artist.id

    if @track.save
       redirect_to edit_artist_album_path(@album)
    else
      render 'new'
    end
  end

  def edit
    @track = ArtistTrack.find(params[:id])
    @album = ArtistAlbum.find(@track.artist_album_id)
    @artist = Artist.find(@track.artist_id)
  end

  def update
    @track = ArtistTrack.find(params[:id])
    @album = ArtistAlbum.find(@track.artist_album_id)
    @artist = Artist.find(@track.artist_id)
    if @track.update_attributes(track_params)
      redirect_to select_artist_album_path(@artist)
    else
      render 'edit'
    end
  end

  def destroy
    ArtistTrack.find(params[:id]).destroy
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

    def correct_album_artist
      @album = ArtistAlbum.find(params[:id])
      redirect_to artist_path(@album.artist_id) if @album.artist_id != current_artist.id
    end

    def correct_track_artist
      @track = ArtistTrack.find(params[:id])
      redirect_to artist_path(@track.artist_id) if @track.artist_id != current_artist.id
    end

    def track_params
      params.require(:artist_track).permit(:track_number, :track_name, :track_artist, :track_url, :track_lyrics)
    end

end
