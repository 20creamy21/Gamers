class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
    @posts = @posts.page(params[:page]).reverse_order
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.all
    @user = @post.user
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to users_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :name, :platform, :genre, :thought, :note, :evaluation, :created_at)
  end
end
