class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = Post.all
    @post = @user.posts
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user)
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
    @posts = Post.page(params[:page]).reverse_order
    @posts = @posts.where(user_id: follow_user_ids)
    @q = @posts.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
