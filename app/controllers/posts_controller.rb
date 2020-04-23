class PostsController < ApplicationController
  def index
    @posts = Post.limit(8).order('id DESC')
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
