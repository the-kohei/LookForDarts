class ToppagesController < ApplicationController
  def index
    @posts = Post.limit(3).order('id DESC')
    # @post = Post.find(params[:id])
    # @category = Category.find(@post.category_id)

  end
end
