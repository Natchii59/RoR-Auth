class ApplicationController < ActionController::Base

  before_action :configure_devise_parameters, if: :devise_controller?

  protected

  def configure_devise_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:email, :username, :password, :password_confirmation]
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_path, alert: "Accès interdit"
  end
end
