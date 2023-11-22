class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # Par défaut, devise permet que le passage du mail comme clé utilisable, il faut donc définir les autres
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:pseudo])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:pseudo])
  end
end
