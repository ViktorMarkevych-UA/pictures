class CategoriesController < ApplicationController

  #before_filter :authenticate_user!, :except => [:show, :index]

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
