class CommentsController < ApplicationController
  def new
    @comment = current_user.comments.build
    @comment.post_id = params[:post_id]
  end

  def create
    @comment = Comment.new(comment_params.merge(post_id: params[:post_id], user_id: current_user.id))
    if @comment.save
      redirect_to post_path(@comment.post)
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end
end
