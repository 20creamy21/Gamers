class RanksController < ApplicationController

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  # Article.order(evaluation: :desc)

end
