class Artists::ShowsController < ApplicationController

  before_action :authenticate_artist!, except: :index
  before_action :correct_artist, except: [:index, :edit, :update, :destroy]
  before_action :set_artist, except: :index
  before_action :correct_show_artist, only: [:edit, :update, :destroy]

  def index
    @artist = Artist.find(params[:id])
    @shows = ArtistShow.all
  end

  def select
    @shows = ArtistShow.all
  end

  def new
    @show = ArtistShow.new
  end

  def create
    @show = @artist.artist_shows.build(show_params)
    if @show.save
      redirect_to select_artist_show_path(@artist)
    else
      render 'new'
    end
  end

  def edit
    @show = ArtistShow.find(params[:id])
  end

  def update
    @show = ArtistShow.find(params[:id])
    if @show.update_attributes(show_params)
      redirect_to select_artist_show_path(@artist)
    else
      render 'edit'
    end
  end

  def destroy
    ArtistShow.find(params[:id]).destroy
    redirect_to select_artist_show_path(@artist)
  end

  private

    def set_artist
      @artist = current_artist
    end

    def correct_artist
      @artist = current_artist
      redirect_to artist_path if @artist != Artist.find(params[:id])
    end

    def correct_show_artist
      @show = ArtistShow.find(params[:id])
      redirect_to artist_path(@show.artist_id) if @show.artist_id != current_artist.id
    end

    def show_params
      params.require(:artist_show).permit(:artist_id, :show_month, :show_day, :show_year, :show_location, :show_venue, :show_ticket_url)
    end

end
