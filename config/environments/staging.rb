Rails.application.routes.default_url_options[:host] = 'HOST'

Rails.application.configure do

  # config.middleware.insert_after(::Rack::Runtime, "::Rack::Auth::Basic", "Production") do |u, p|
  #   [u, p] == ['admin', 'frank777']
  # end

  config.secret_key_base = 'somekey'
  config.cache_classes = true

  config.eager_load = true

  config.active_job.queue_adapter = :sidekiq

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_files = true
  config.assets.compile = true
  config.static_cache_control = "public, max-age=31536000"

  config.log_level = :error

  config.assets.digest = true

  config.active_support.deprecation = :notify
  # config.log_formatter = ::Logger::Formatter.new

  config.active_record.dump_schema_after_migration = false

  # config.logger = RemoteSyslogLogger.new('logs3.papertrailapp.com', 40188)

  config.action_mailer.perform_deliveries = true
  config.action_mailer.default_url_options = { host: 'HOST' }
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  # config.action_mailer.smtp_settings = { :address => "localhost", :port => 1025 }
  config.action_mailer.smtp_settings = {
  address: 'smtp.mandrillapp.com',
  authentication: :login,
  domain: 'DOMAIN',
  enable_starttls_auto: true,
  password: 'PASSWORD',
  port: "587",
  user_name: 'business'
}

end


Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379/2' }
end

Sidekiq.configure_client do |config|
  config.redis = { :url => 'redis://localhost:6379/2' }
end


ENV['EMBER_ENV'] = 
ENV['REDIS_URL'] = 

ENV['FACEBOOK_KEY'] = 
ENV['FACEBOOK_SECRET'] = 

ENV['EFW_BASE_API_URL'] = 
ENV['EFW_BASE_APP_URL'] = 
ENV['EFW_BASE_FLEX_URL'] = 
