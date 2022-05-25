class SuperpowersController < ApplicationController
  before_action :set_superpower, only: [:update, :edit, :show, :destroy]

  def index
    if params[:search].present?
      @superpowers = Superpower.search_by_name(params[:search])
    else
      @superpowers = Superpower.all
    end
    if params[:min_price].present?
      @superpowers = @superpowers.where("price >= ?", params[:min_price])
    end
    if params[:max_price].present?
      @superpowers = @superpowers.where("price <= ?", params[:max_price])
    end
    if params[:name].present?
      @superpowers = @superpowers.where(name: params[:name])
    end
    if params[:starts_at].present? && params[:ends_at].present?
      @superpowers = @superpowers.select do |superpower|
        superpower.is_available?(params[:starts_at], params[:ends_at])
      end
    end
  end

  def show
    @booking = Booking.new
    @bookings_dates = @superpower.bookings.map do |booking|
      {
        from: booking.starts_at,
        to: booking.ends_at
      }
    end
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
    @superpower.update(superpower_params)
    redirect_to superpowers_path(@superpowers)
  end

  def destroy
    @superpower = Superpower.find(params[:id])
    @superpower.user = current_user
    @superpower.destroy
    redirect_to superpowers_path(@superpowers)

  end

  private

  def set_superpower
    @superpower = Superpower.find(params[:id])
  end

  def superpower_params
    params.require(:superpower).permit(:name, :description, :price)
  end
end
