class CommentController < ApplicationController

  def new

  end

  def all_comm
    @comments = Comment.order("created_at ASC").all

  end

  def create
    comment = current_user.comments.new(params[:comment])
    comment.save!
    redirect_to :back
  end
end

