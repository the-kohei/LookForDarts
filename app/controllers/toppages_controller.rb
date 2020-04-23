class ToppagesController < ApplicationController
  def index
    @posts = Post.limit(4).order('id DESC')
  end
end
