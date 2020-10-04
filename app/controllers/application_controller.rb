class ApplicationController < ActionController::Base

  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:Nickname,:First_name,:First_name,:Family_name,:First_name_kana,:Family_name_kana,:Birth_day])

  end

  private

  def production?
    Rails.env.production?
  end
  def address_params
    params.requre(:sending_destination).permit(:prefecture_name)
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

end
