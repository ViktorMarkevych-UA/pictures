class CommentsController < ApplicationController

  def index
    @comments = Comment.paginate(page: params[:page], per_page: 5).order('created_at ASC').all
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.picture_id = params[:picture_id]
    @comment.save!
    redirect_to picture_path(@comment.picture)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end

