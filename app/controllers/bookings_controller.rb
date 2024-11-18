class BookingsController < ApplicationController
    before_action :authenticate_user!
  
    def index
      if current_user.photographer?
        @bookings = Booking.all
      else
        @bookings = current_user.bookings
      end
    end
  
    def new
      @booking = current_user.bookings.build
    end
  
    def create
      @booking = current_user.bookings.build(booking_params)
      if @booking.save
        redirect_to bookings_path, notice: 'Booking was successfully created.'
      else
        render :new
      end
    end
  
    private
  
    def booking_params
      params.require(:booking).permit(:date)
    end
  end
  
