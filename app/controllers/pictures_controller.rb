class PicturesController < ApplicationController

  def index
    @pictures = Picture.set_collections(params)
  end

  def show
    @picture = Picture.preload(comments: :user).find(params[:id])
    @pictures = @picture.category.pictures.where.not(id: @picture.id)
  end

end