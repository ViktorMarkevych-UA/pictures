class NegativeLikesController < ApplicationController

  def create
    picture = Picture.find(params[:picture_id])
    likes = NegativeLike.manage_like_for(picture, current_user)
    render json: likes
  end

end
