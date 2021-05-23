class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to posts_path
  end

  def index
  end

  def show
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :name, :platform, :genre, :thought, :note, :created_at)
  end

end
