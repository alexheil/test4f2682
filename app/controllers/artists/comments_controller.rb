class Artists::CommentsController < ApplicationController

  before_action :authenticate_commenter, only: :create

  def create
    @comment = ArtistMicropostComment.new(comment_params)
    if artist_signed_in?
      @comment.artist_id = current_artist.id
      @comment.artist_name = current_artist.artist_name
    elsif fan_signed_in?
      @comment.fan_id = current_fan.id
      @comment.fan_name = current_fan.fan_name
    end
    if @comment.save
      redirect_to (:back)
    else
      redirect_to root_url
    end
  end

  def destroy
    ArtistMicropostComment.find(params[:id]).destroy
    redirect_to (:back)
  end

  private

    def authenticate_commenter
      authenticate_artist! unless fan_signed_in? || authenticate_fan! unless artist_signed_in?
    end

    def comment_params
      params.require(:artist_micropost_comment).permit(:artist_micropost_id, :content, :upvotes, :downvotes, :total_votes)
    end
end
