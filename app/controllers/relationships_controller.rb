class RelationshipsController < ApplicationController

  before_action :authenticate_fan!

  def create
    @artist = Artist.find(params[:id])
    @relationship = Relationship.new
    @relationship.fan_id = current_fan.id
    @relationship.artist_id = @artist.id
    if @relationship.save
      redirect_to artist_path(@artist)
    else
      redirect_to root_url
    end
  end

  def destroy
    current_fan.unfollow(Artist.find(params[:id]))
    redirect_to (:back)
  end

end
