class RelationshipsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = @post.user
    following = current_user.follow(params[:follow_id])
    following.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    following = current_user.unfollow(params[:follow_id])
    following.destroy
  end
end
