class PicturesController < ApplicationController

  def index
    @pictures =
        if params[:category_id]
          Picture.where(:category_id => params[:category_id]).order("likes_count ASC")
        else
          Picture.order("likes_count ASC").all
        end
    @pictures = @pictures.map{ |picture| [picture.image.url(:large).html_safe, picture.id] }
  end

  def show
    @picture = Picture.preload(comments: :user).find(params[:id])
  end

end