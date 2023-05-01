class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound, with: :notfound
  rescue_from ActionController::RoutingError, with: :notfound

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, profile_attributes: [:name, :role]])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, profile_attributes: [:name, :role]])
  end

  def notfound
    render file: 'public/404.html', status: :not_found, layout: false
  end
end