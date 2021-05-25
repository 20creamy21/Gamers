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
    @posts = Post.all
  end

  def show
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :name, :platform, :genre, :thought, :note, :evaluation, :created_at)
  end

end
