class ApplicationController < ActionController::Base
    before_action :authenticate_user!
  
    def after_sign_in_path_for(resource)
      if resource.client?
        client_dashboard_path
      else
        photographer_dashboard_path
      end
    end
  
    def after_sign_out_path_for(_resource_or_scope)
      new_user_session_path
    end
  end
  