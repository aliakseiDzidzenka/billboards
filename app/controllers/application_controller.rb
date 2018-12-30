class ApplicationController < ActionController::Base
	before_action :set_locale
	before_action :configure_permitted_parameters, if: :devise_controller?
	
	def set_locale
    I18n.locale = params[:locale] ||
        I18n.default_locale
	end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :phone, :remember_me)}
		devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me)}
		devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:avatar, :first_name, :last_name, :username, :birthdate, :phone, :email, :password, :current_password, :remember_me)}
	end
end
