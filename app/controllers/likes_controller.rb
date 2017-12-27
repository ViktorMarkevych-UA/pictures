class LikesController < ApplicationController

  def create
    picture = Picture.find(params[:picture_id])
    like_status = Like.manage_like_for(picture, current_user).present?
    render json: like_status
  end

end
