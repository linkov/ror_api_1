module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:password) { |u| u.permit(:redirect_url, :email) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:password, :email) }
    devise_parameter_sanitizer.for(:sign_up)  { |u| u.permit(:password, :email, :default_confirm_success_url,:guest,:locale)}
  end

end

DeviseController.send :include, DevisePermittedParameters