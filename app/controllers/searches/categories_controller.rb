class Searches::CategoriesController < ApplicationController

  def index
    p '*'*100
    p params
    p '*'*100
    names_list = Category.where('name ILIKE ?', "%#{params[:term]}%").map{ |item| { id: item.id, text: item.name } }
    p '#'*100
    p names_list
    p '#'*100
    render json: names_list
  end
end
