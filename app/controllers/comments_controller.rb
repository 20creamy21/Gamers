class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @commnet = current_user.comments.new(comment_params)
    @comment.save
    redirect_to post_path(@comment.post)
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :created_at)
  end

end
