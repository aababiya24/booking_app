class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  # Customize the sign-up process
  def create
    super do |user|
      user.role = params[:user][:role]
      user.save
    end
  end

  protected

  # Permit the role parameter for sign-up and also added first name and last name because it wasnt saving the registration
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :first_name, :last_name ])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :role])
  end
end
