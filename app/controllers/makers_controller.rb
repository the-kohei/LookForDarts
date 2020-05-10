class MakersController < ApplicationController

  def index
    
  end

  def show
    @makers = Maker.limit(8).order('id DESC')
  end
end
