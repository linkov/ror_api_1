Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], info_fields: 'email,name', scope: 'email', :provider_ignores_state => true,  strategy_class: OmniAuth::Strategies::Facebook
end
