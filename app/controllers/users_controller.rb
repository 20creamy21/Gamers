class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = Post.all
    @post = @user.posts
  end

  def follow_index
    @user = current_user
    @users = @user.followings
  end

  def follower_index
    @user = current_user
    @users = @user.followers
  end

end
