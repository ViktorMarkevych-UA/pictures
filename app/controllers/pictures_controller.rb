class PicturesController < ApplicationController

  def index
    @pictures = Picture.set_collections(params)
  end

  def show
    @picture = Picture.find(params[:id])
    @comments = @picture.comments.preload(:user)
    @pictures = @picture.category.pictures.where.not(id: @picture.id)
  end

end