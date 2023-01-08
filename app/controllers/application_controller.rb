class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[postal_code prefecture_code city street other_address self_introduction])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[postal_code prefecture_code city street other_address self_introduction])
  end

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

  def show
    @user = User.find(params[:id])
  end
end
