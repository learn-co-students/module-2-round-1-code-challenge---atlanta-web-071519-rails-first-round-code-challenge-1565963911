class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    set_heroine
  end

  def new
    @heroine = Heroine.new 
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to heroine_path(@heroine)
    else  
      render :new
    end 
  end

  def edit
    set_heroine
  end

  def update
    set_heroine
    if @heroine.update(heroine_params)
      redirect_to heroine_path(@heroine)
    else 
      render :edit
    end 
  end

  def destroy
    set_heroine
    @heroine.destroy
    redirect_to heroines_path 
  end

  private

  def set_heroine
    @heroine = Heroine.find(params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
