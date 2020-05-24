class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search, :user_posts, :category_posts, :maker_posts]
  def index
    @posts = Post.includes(:user).limit(8).order('id DESC').page(params[:page]).per(8)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    post = Post.new(post_params)
    if post.save
      redirect_to "/posts", notice: '投稿完了しました'
    else
      flash.now[:notice] = '入力は全て必須です'
      render "posts/new"
    end
    
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
      redirect_to posts_path, notice: '投稿を更新しました'
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

  def maker_posts
    maker = Maker.find(params[:maker_id])
    @posts = maker.posts.limit(8).order('id DESC').page(params[:page]).per(8)
    @name = maker.name
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
