class BookingsController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_client_role
  
    def index
      if current_user.photographer?
        @bookings = Booking.all
      else
        @bookings = current_user.bookings
      end
    end
  
    def new
      @photographer = User.photographers.find(params[:photographer_id])
      @booking = current_user.bookings.build
    end
  
    def create
      @photographer = User.photographers.find(params[:booking][:photographer_id])
      @booking = current_user.bookings.build(booking_params)
      if @booking.save
        redirect_to bookings_path, notice: 'Booking was successfully created.'
      else
        render :new, alert: 'Error creating booking.'
      end
    end
  
    private
  
    def booking_params
      params.require(:booking).permit(:date, :photographer, :photographer_id)
    end

    def ensure_client_role
      redirect_to root_path, alert: "Access denied!" unless current_user.client?
    end
  end
  
