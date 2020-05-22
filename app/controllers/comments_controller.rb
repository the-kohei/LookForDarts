class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    comment = @post.comments.build(comment_params)
    if comment.save!
      redirect_to "/posts/#{comment.post_id}"
    else
    comment = Comment.new(comment_params)
    if comment.save!
      redirect_to "/posts/#{comment.post_id}"
    else
      @post = Post.find(params[:post_id])
      @comments = @post.comments.includes(:user).limit(8).order('id DESC').page(params[:page]).per(5)
      @comment = Comment.new(comment_params)
      render "posts/show" 
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end