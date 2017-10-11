class PicturesController < ApplicationController

  def index
    @pictures =
        if params[:category_id]
          Picture.where(:category_id => params[:category_id]).order("likes_count DESC")
        else
          Picture.order("likes_count DESC").all
        end
  end

  def show
    @picture = Picture.preload(comments: :user).find(params[:id])
  end

end