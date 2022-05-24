class BookingsController < ApplicationController

  def new
    @superpower = Superpower.find(params[:superpower_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @superpower = Superpower.find(params[:superpower_id])
    @booking.superpower = @superpower
    if @booking.save
      redirect_to superpower_path(@superpower)
    else
      render :new
    end
  end

  def destroy
    @booking = booking.find(params[:id])
    @booking.destroy
    redirect_to superpowers_path
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :superpower_id)
  end
end
