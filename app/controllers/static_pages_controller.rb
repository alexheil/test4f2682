class StaticPagesController < ApplicationController
  def home
    @artists = Artist.all
  end

  def privacy
  end

  def terms_of_use
  end

  def contact
  end

  def about
  end

  def faq
  end

  def copyright
  end

  def sign_up
    if artist_signed_in? || fan_signed_in?
      redirect_to root_url
    end
  end

  def sign_in
    if artist_signed_in? || fan_signed_in?
      redirect_to root_url
    end
  end
end
