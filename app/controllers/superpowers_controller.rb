class SuperpowersController < ApplicationController
  before_action :set_superpower, only: [:update, :edit, :show, :destroy]


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
    @superpower.user = current_user
    if @superpower.save
      redirect_to superpowers_path(@superpowers)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @superpower.update(params[:superpower])
    @superpower.user = current_user
    redirect_to superpowers_path(@superpowers)
  end

  def destroy
    @superpower.destroy
    @superpower.user = current_user
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
