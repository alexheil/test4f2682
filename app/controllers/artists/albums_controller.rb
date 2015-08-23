class Artists::AlbumsController < ApplicationController

  before_action :authenticate_artist!, except: [:index, :show]
  before_action :correct_artist, except: [:index, :show, :edit, :update, :destroy]
  before_action :set_artist, except: [:index, :show]
  before_action :correct_album_artist, only: [:edit, :update, :destroy]

  def index
    @artist = Artist.find(params[:id])
  end

  def select
    @album = ArtistAlbum.all
  end

  def show
    @album = ArtistAlbum.find(params[:id])
    @artist = Artist.find(@album.artist_id)
  end

  def new
    @album = ArtistAlbum.new
  end

  def create
    @album = @artist.artist_albums.build(album_params)
    if @album.save
      redirect_to select_artist_album_path(@artist)
    else
      render 'new'
    end
  end

  def edit
    @album = ArtistAlbum.find(params[:id])
  end

  def update
    @album = ArtistAlbum.find(params[:id])
    if @album.update_attributes(album_params)
      redirect_to select_artist_album_path(@artist)
    else
      render 'new'
    end
  end

  def destroy
    ArtistAlbum.find(params[:id]).destroy
    redirect_to select_artist_album_path(@artist)
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

    def album_params
      params.require(:artist_album).permit(:album_name, :album_year, :album_cover_art_url)
    end

end
