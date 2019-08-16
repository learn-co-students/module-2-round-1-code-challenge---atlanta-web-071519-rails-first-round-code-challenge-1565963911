class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def show
    set_power
  end

  def new
  end

  def create
    @power = Power.new(power_params)
    if @power.save
      redirect_to power_path(@power)
    else  
      render :new
    end 
  end

  def edit
    set_power
  end

  def update
    set_power
    if @power.update(power_params)
      redirect_to power_path(@power)
    else 
      render :edit
    end 
  end

  def destroy
    set_power
    @power.destroy
    redirect_to powers_path 
  end

  private

  def set_power
    @power = Power.find(params[:id])
  end

  def power_params
    params.require(:power).permit(:name, :description)
  end
end
