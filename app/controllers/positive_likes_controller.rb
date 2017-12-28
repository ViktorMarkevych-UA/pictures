class PositiveLikesController < ApplicationController

  def create
    picture = Picture.find(params[:picture_id])
    likes = PositiveLike.manage_like_for(picture, current_user)
    render json: likes
  end

end
