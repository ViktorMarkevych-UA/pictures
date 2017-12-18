class CategoriesController < ApplicationController

  before_action :set_category, only: %i[show edit update]

  def index
    @category = current_user.categories.build
    @categories = Category.all.preload(:pictures)
  end

  def new
    @category = current_user.categories.build
  end

  def show
  end

  def edit
  end

  def create
    @category = current_user.categories.build(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to category_path(@category), notice: 'Is Created!' }
        format.json
      else
        format.html { render action: 'new' }
        format.json { render json: @category.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_path(@category), notice: 'Is Updated!' }
        format.json
      else
        format.html { render action: 'edit' }
        format.json { render json: @category.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end