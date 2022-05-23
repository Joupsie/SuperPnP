class SuperpowersController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
   @superpowers = Superpower.all
  end

  def show
  end

  def new
    @superpower = Superpower.new
  end

  def create
    @superpower = Superpower.new(superpower_params)
    if @superpower.save
      redirect_to superpower_path(@superpower)
    else
      render :new
    end
  end

  def destroy
    @superpower.destroy
    redirect_to superpowers_path
  end

  private

  def set_superpower
    @superpower = Superpower.find(params[:id])
  end

  def superpower_params
    params.require(:superpower).permit(:name, :description, :price)
  end
end
