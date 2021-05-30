class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = Post.all
    @post = @user.posts
  end

  def follow_index
    @users = User.all
  end

  def follower_index
    @users = User.all
  end

end
