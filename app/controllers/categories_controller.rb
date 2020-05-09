class CategoriesController < ApplicationController
  def index
    @categories = Category.limit(8).order('id DESC')
  end
end
