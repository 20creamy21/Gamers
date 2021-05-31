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

end
