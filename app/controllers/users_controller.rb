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
    # follow_user_ids = @user.followings.pluck(:id)
    # @posts = Post.where(user_id: follow_user_ids)
    @q = Post.ransack(params[:q])

    follow_user_ids = @user.followings.pluck(:id)
    @post = Post.page(params[:page]).reverse_order
    @posts = @post.where(user_id: follow_user_ids)
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
