require 'net/http'
require 'uri'
require 'rest-client'
require 'descriptive_statistics'

  class Api::ApiController < ActionController::Base
    include DeviseTokenAuth::Concerns::SetUserByToken

    # protect_from_forgery with: :null_session
    serialization_scope :view_context
    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
    # before_action :authenticate_user!, except: [:landingwork, :landing_art_categories, :expertise_tags, :general_info, :landingexpertises, :landingexpert,:landingexperts,:art_categories,:parent_art_categories]
    # before_action :user_needed, except: [:landingwork, :landing_art_categories, :expertise_tags, :general_info, :landingexpertises, :landingexpert,:landingexperts,:art_categories,:parent_art_categories]
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_locale
    before_bugsnag_notify :add_user_info_to_bugsnag
    respond_to :json

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:password, :email) }
      devise_parameter_sanitizer.for(:sign_up).push(:password, :email, :default_confirm_success_url,:guest,:locale)
      devise_parameter_sanitizer.for(:password).push(:redirect_url)
    end

    def general_info
      lowest_review_price = User.all.collect(&:price).min
      render json:{general_info:{
        lowest_review_price:lowest_review_price
        }}
    end

    def art_categories
      render json:ArtCategory.all,each_serializer: Api::V1::ArtCategorySerializer, :root => 'art_category'
    end

    def expertise_tags
      render json:Expertise.all,each_serializer: Api::V1::ExpertiseSerializer, :root => 'expertise'
    end

    def parent_art_categories
      render json:ParentArtCategory.all,each_serializer: Api::V1::ParentArtCategorySerializer, :root => 'parent_art_category'
    end

    def landingexperts
      @usrs = User.where(:flexreview => true)
      render json:@usrs,each_serializer: Api::V1::ExpertPreviewSerializer, :root => 'user'
    end

    def landing_art_categories
      models = ArtCategory.find(params[:id])
      render json:models,serializer: Api::V1::ArtCategorySerializer, :root => 'art_category'
    end

    def landingexpertises
      models = Expertise.find(params[:id])
      render json:models,serializer: Api::V1::ExpertiseSerializer, :root => 'expertise'
    end

    def landingexpert
      user = User.find(params[:user_id])
      render json:user,serializer: Api::V1::ExpertPreviewSerializer, :root => 'user'
    end

    def landingwork
      model = Work.all.where(:public => true).first
      render json:model,serializer: Api::V1::WorkSerializer, :root => 'work'
    end



    def set_locale

      if current_user && current_user.locale
        I18n.locale = current_user.locale

      else
        loc = http_accept_language.compatible_language_from(I18n.available_locales)

        if loc
          I18n.locale = loc
        else

          I18n.locale = 'en'
        end
      end

    end


    def user_needed
      unless current_user
        render :json => {'error' => 'authentication error'}, :status => 401
      end
    end


    private
    def add_user_info_to_bugsnag(notification)
      notification.user = {
        email: current_user.email,
        id: current_user.id
      }
    end



end
