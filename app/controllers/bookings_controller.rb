class BookingsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_booking, only: [:edit, :update, :destroy]
    before_action :ensure_client_role
  
    def index
      if current_user.photographer?
        @bookings = Booking.all
      else
        @bookings = current_user.bookings
      end
    end

    def edit
      @photographer = @booking.photographer # Fetch the associated photographer
    end

    def update
      if @booking.update(booking_params)
        redirect_to client_dashboard_path, notice: 'Booking was successfully updated.'
      else
        render :edit, alert: 'Error updating booking.'
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
        flash[:notice] = "Thank you! Your booking has been confirmed."
        redirect_to client_dashboard_path
      else
        render :new, alert: 'Error creating booking.'
      end
    end

    def destroy
      @booking.destroy!
      redirect_to client_dashboard_path, notice: 'Booking deleted successfully.'
      
    end


  
    private

    def set_booking
      @booking = Booking.find(params[:id])
    end
  
    def booking_params
      params.require(:booking).permit(:date, :photographer, :photographer_id, :message)
    end

    def ensure_client_role
      redirect_to root_path, alert: "Access denied!" unless current_user.client?
    end
  end
  
