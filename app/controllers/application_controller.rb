class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
 FORECAST_KEY = "52257016e380daa78bdba4b79225ab6e"

  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :set_temperature
  protected

  # def set_temperature
  #   if current_user.present?
  #     geocode = current_user.geocode
  #     lat, long = geocode.first, geocode.last
  #      url = "https://api.forecast.io/forecast/#{FORECAST_KEY}/#{long},#{lat}"
  #      results = JSON.parse(open(url).read)
  #      @temperature = results['currently']['temperature']
  #      @summary = results['currently']['summary']
  #    end
  #  end



  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end
end
