class Fans::FansController < ApplicationController

  def index
  end

  def show
    @fan = Fan.find(params[:id])
  end

  def following
    @fan = Fan.find(params[:id])
  end

end
