class DeviceRegistrationController < DeviseTokenAuth::RegistrationsController
  before_filter :configure_permitted_parameters


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:temp_uid)
  end

  def sign_up_params
    params.require(:user).permit(:email, :name, :password, :default_confirm_success_url,:guest,:locale )
  end


  def create
    super do |resource|
      resource.onboarding = true
      resource.save!
      #UsersMailer.welcome_email(resource.id).deliver_now


    end
  end

end
