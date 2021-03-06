class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_category

  protected
  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: %i[nickname surname_name first_name surname_name_kana first_name_kana birthday phone])
  end

  def set_category
    @category = MainCategoty.all.includes(sub_categories: :sub2_categories)
  end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end