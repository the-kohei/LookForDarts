class CategoriesController < ApplicationController
def index
end

  def show
    @categories = Category.limit(8).order('id DESC')
  end
end
