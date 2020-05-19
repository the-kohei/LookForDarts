class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]
  def index
    @posts = Post.includes(:user).limit(8).order('id DESC').page(params[:page]).per(8)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
  end

  def show
    @comment = Comment.new
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user).limit(8).order('id DESC').page(params[:page]).per(5)
    
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path, notice: '投稿を更新しました'
    else
      render :edit
    end
  end

  def user_posts
    user = User.find(params[:user_id])
    @posts = user.posts.limit(8).order('id DESC').page(params[:page]).per(8)
    @name = user.name
  end

  def category_posts
    category = Category.find(params[:category_id])
    @posts = category.posts.limit(8).order('id DESC').page(params[:page]).per(8)
    @name = category.name
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  private
  def post_params
    params.require(:post).permit(:title, :text, :image, :category_id, :maker_id).merge(user_id: current_user.id)
  end
end

def move_to_index
  redirect_to action: :index unless user_signed_in?
end
