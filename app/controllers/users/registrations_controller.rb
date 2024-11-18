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

  # Permit the role parameter for sign-up
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
end