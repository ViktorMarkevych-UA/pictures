class CategoriesController < ApplicationController

  def index
    @categories = Category.all.preload(:pictures)
  end

  def show
    @category = Category.find(params[:id]).preload(:pictures)
  end

end