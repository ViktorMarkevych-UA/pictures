class PicturesController < ApplicationController

  def index
    @pictures = Picture.order("likes_count DESC").all
  end

  def show
    @picture = Picture.includes(:comments).find(params[:id])
  end

end