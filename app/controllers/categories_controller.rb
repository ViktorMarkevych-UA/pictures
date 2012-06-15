class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def catlist
    @category = Category.find(params[:id])
    @pictures = Picture.paginate(:page => params[:page], :per_page => 5).find_all_by_category_id(params[:id])
  end
end
