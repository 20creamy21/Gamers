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
    @users = @user.followings
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

end
