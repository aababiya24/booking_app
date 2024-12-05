class DashboardsController < ApplicationController
    before_action :authenticate_user!
  
    def index
      if current_user.client?
        redirect_to client_dashboard_path
      elsif current_user.photographer?
        redirect_to photographer_dashboard_path
      end
    end
  
    def client
      # Logic for the client's dashboard
      if current_user.client?
        @photographers = if params[:search].present?
                           User.photographers_by_first_name(params[:search])
                         else
                           User.photographers
                         end
      else
        redirect_to root_path, alert: "Access denied!"
      end

      @bookings = Booking.where(user_id: current_user.id)
    end
  
    def photographer
      # Logic for the photographer's dashboard
      if current_user.photographer?
        
        @bookings = Booking.where(photographer_id: current_user.id).order(date: :asc)
    
      else
        redirect_to root_path, alert: "Access denied!"
      end
    end
  end
  
