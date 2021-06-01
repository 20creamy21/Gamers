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
#    search = params[:q][:name_or_title_cont]
#    @result = Post.where("name like '%#{search}%' or title like '%#{search}%'")
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def show
    @post = Post.find(params[:id])
    # @comment = Comment.find(params[:id])
    @comments = Comment.all
    @user = @post.user
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :name, :platform, :genre, :thought, :note, :evaluation, :created_at)
  end

end
