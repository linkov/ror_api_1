Rails.application.routes.default_url_options[:host] = 'localhost:8080'

Rails.application.configure do
  config.secret_key_base = 'somekey'
  config.cache_classes = false

  config.active_job.queue_adapter = :sidekiq

  config.eager_load = false

  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.active_support.deprecation = :log
  config.serve_static_files = true
  config.active_record.migration_error = :page_load

  # config.log_level = :error

  config.assets.debug = true
  config.assets.digest = false
  config.assets.raise_runtime_errors = true

  config.action_mailer.perform_deliveries = true
  config.action_mailer.default_url_options = { host: 'localhost:8080' }
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  # config.action_mailer.smtp_settings = { :address => "localhost", :port => 1025 }
  config.action_mailer.smtp_settings = {
  address: 'smtp.mandrillapp.com',
  authentication: :login,
  domain: 'localhost:8080',
  enable_starttls_auto: true,
  password: '7VjG7H_nBOuIhRGD4vGUWw',
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


# ENV['SKIP_EMBER'] = 'true'
ENV['EMBER_ENV'] = 'development'
ENV['REDIS_URL'] = 'redis://127.0.0.1:6379/13'

ENV['FACEBOOK_KEY'] = 
ENV['FACEBOOK_SECRET'] = 

ENV['EFW_BASE_API_URL'] = 
ENV['EFW_BASE_APP_URL'] = 
