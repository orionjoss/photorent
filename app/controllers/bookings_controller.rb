class BookingsController < ApplicationController
  def index
    @bookings = Booking.All
  end

  def new
    @camera = Camera.find(params[:camera_id])
    @booking = Booking.new
  end

  def create
    @camera = Camera.find(params[:camera_id])
    @booking = Booking.new(booking_params)
    @booking.camera = @camera
    @booking.user = current_user
    if @booking.save
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

  def accept
    @booking = Booking.find(params[:id])
    @booking.update!({status: "Accepted"})
    redirect_to dashboard_path
  end

    #if user clicks on "accept" button then change status to "accepted"
    #else change to status "available"

  def decline
      @booking = Booking.find(params[:id])
      @booking.update!({status: "Rejected"})
      redirect_to dashboard_path
    end


  # def edit
  #     @booking = Booking.find(params[:id])
  # end

  # def update
  #   @booking = Booking.find(params[:id])
  #   if @booking.update(booking_params)
  #     redirect_to booking_path
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :vehicle_id)
  end
end
