class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = Post.all
    @post = @user.posts
  end

  def follow_index
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def follower_index
    @user = User.find(params[:id])
    @users = @user.followers
  end

  def index
    @user = current_user
    follow_user_ids = @user.followings.pluck(:id)
    @posts = Post.where(user_id: follow_user_ids)
    @q = Post.ransack(params[:q])
  end

end
