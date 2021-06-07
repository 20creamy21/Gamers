class RelationshipsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = @post.user
    following = current_user.follow(params[:follow_id])
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    following = current_user.unfollow(params[:follow_id])
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
    end
  end
end
