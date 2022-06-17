

  class DeviceTokenPasswordController < DeviseTokenAuth::PasswordsController

    skip_before_action :protect_from_forgery
    protect_from_forgery with: :null_session

    before_filter :configure_permitted_parameters

    def edit
      @resource = resource_class.reset_password_by_token({
                                                             reset_password_token: params[:reset_password_token]
                                                         })

      if @resource and @resource.id
        client_id  = SecureRandom.urlsafe_base64(nil, false)
        token      = SecureRandom.urlsafe_base64(nil, false)
        token_hash = BCrypt::Password.create(token)
        expiry     = (Time.now + DeviseTokenAuth.token_lifespan).to_i

        @resource.tokens[client_id] = {
            token:  token_hash,
            expiry: expiry
        }

        # ensure that user is confirmed
        @resource.skip_confirmation! if @resource.devise_modules.include?(:confirmable) && !@resource.confirmed_at

        # allow user to change password once without current_password
        @resource.allow_password_change = true

        @resource.save!
        yield @resource if block_given?

        redirect_to(@resource.build_auth_url(params[:redirect_url], {
            token:          token,
            client_id:      client_id,
            reset_password: true,
            config:         params[:config]
        }))
      else
        render_edit_error
      end
    end
  end
