class RegistrationsController < DeviseTokenAuth::RegistrationsController

  def render_create_success
    # here, the @resource is accessible, in your case, a User instance.
    render json: {status: 'success', data: @resource}
  end

end