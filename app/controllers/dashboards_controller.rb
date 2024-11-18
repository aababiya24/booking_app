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
    end
  
    def photographer
      # Logic for the photographer's dashboard
    end
  end
  
