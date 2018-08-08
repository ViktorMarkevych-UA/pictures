class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  layout :select_layout

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |params|
      params.permit(:last_name, :first_name, :email, :password, :password_confirmation, :remember_me)
    end

    devise_parameter_sanitizer.permit(:account_update) do |params|
      params.permit(:last_name, :first_name, :email, :password, :password_confirmation, :current_password)
    end
  end

  def select_layout
    devise_controller? ? 'authorization' : 'application'
  end
end