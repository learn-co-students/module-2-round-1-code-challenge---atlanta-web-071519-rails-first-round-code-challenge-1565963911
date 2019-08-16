class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end 

  def new
    @heroine = Heroine.new
  end 

  def create
    @heroine = Heroine.new(heroine_params)
	
  
  end 
  

end
