class LikesController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    unless @picture.likes.find_by_user_id(current_user.id)
      like = @picture.likes.build(:user_id => current_user.id)
      flash[:error] = "Error" unless like.save
    end
    redirect_to :back
  end

end
