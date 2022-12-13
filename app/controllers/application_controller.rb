# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # private
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
  # end

  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def after_sign_in_path_for(_resource)
    '/books/'
  end

  def after_sign_out_path_for(_resource)
    '/books/'
  end

  # def update_resource(resource, params)
  #   resource.update_without_current_password(params)
  # end

  # def update_without_current_password(params, *options)
  #   params.delete(:current_password)

  #   if params[:password].blank? && params[:password_confirmation].blank?
  #     params.delete(:password)
  #     params.delete(:password_confirmation)
  #   end

  #   result = update(params, *options)
  #   clean_up_passwords
  #   result
  # end
  

end
