class ToppagesController < ApplicationController
  def index
    @posts = Post.limit(4).order('id DESC')
    @name = current_user.name
    
    # @post = Post.find(params[:id])
    # @category = Category.find(@post.category_id)
  end
end
