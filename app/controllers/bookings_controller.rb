class BookingsController < ApplicationController
  def index
    @bookings = Booking.All
  end

  def new
    @camera = Camera.find(params[:camera_id])
    @bookings = Booking.New
  end

  def create
    @camera = Camera.find(params[:camera_id])
    @bookings = Booking.new(booking_params)
    @booking.camera = @camera
    @booking.user = current_user
    if @bookings.save
      redirect_to camera_path(@camera)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to camera_path(@booking.camera), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
