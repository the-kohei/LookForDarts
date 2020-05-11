class MakersController < ApplicationController

  def index
    @makers = Maker.all
  end

  def show
    @makers = Maker.limit(8).order('id DESC')
  end
end
