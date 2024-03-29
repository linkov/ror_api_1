class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  # include DeviseTokenAuth::Concerns::SetUserByToken
  # include LocaleSetter::Controller

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # serialization_scope :view_context
  #
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:password, :email) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:password, :email, :default_confirm_success_url,:guest,:locale) }
    devise_parameter_sanitizer.for(:account_update) << :redirect_url
  end

  # respond_to :json

  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  # include DeviseTokenAuth::Concerns::SetUserByToken

  # after_filter :cors_set_access_control_headers

  # def cors_set_access_control_headers
  #   headers['Access-Control-Allow-Origin']      = '*'
  #   headers['Access-Control-Allow-Methods']     = 'POST, GET, OPTIONS'
  #   headers['Access-Control-Max-Age']           = '1728000'
  #   headers['Access-Control-Allow-Credentials'] = 'true'
  # end

  def set_admin_locale
    I18n.locale = :en
  end





  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #
  # rescue ActiveRecord::RecordNotFound # if session[:user_id] invalid
  #   session[:user_id] = nil
  # end
  # helper_method :current_user
  #
  #
  #
  # def authorize
  #   redirect_to '/user/sign_in' unless current_user
  # end
  #
  # def authorize_with_guest
  #   redirect_to '/user/sign_in' unless current_or_guest_user
  # end
  #
  #
  # # if user is logged in, return current_user, else return guest_user
  # def current_or_guest_user
  #   if current_user
  #     if session[:guest_user_id] && session[:guest_user_id] != current_user.id
  #       logging_in
  #       # reload guest_user to prevent caching problems before destruction
  #       guest_user(with_retry = false).reload.try(:destroy)
  #       session[:guest_user_id] = nil
  #     end
  #     current_user
  #   else
  #     guest_user
  #   end
  # end
  # helper_method :current_or_guest_user
  #
  # # find guest_user object associated with the current session,
  # # creating one as needed
  # def guest_user(with_retry = true)
  #   # Cache the value the first time it's gotten.
  #   @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)
  #
  # rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
  #   session[:guest_user_id] = nil
  #   guest_user if with_retry
  # end
  #
  # private
  #
  # # called (once) when the user logs in, insert any code your application needs
  # # to hand off from guest_user to current_user.
  # def logging_in
  #   # For example:
  #   guest_ratings = Rating.where(:author =>guest_user).all
  #   guest_ratings.each do |rating|
  #     rating.author = current_user
  #     rating.save!
  #   end
  # end
  #
  # def create_guest_user
  #   u = User.create(:name => "guest", :email => "guest_#{Time.now.to_i}#{rand(100)}@example.com")
  #   u.save!(:validate => false)
  #   session[:guest_user_id] = u.id
  #   u
  # end


end
