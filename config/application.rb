require File.expand_path('../boot', __FILE__)

require 'rails/all'
require "action_view"
require "action_view/template/resolver"


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SerializationHelper
  class Load
    def self.truncate_table(table)
      true
    end
  end
end

module Artagent
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    config.action_controller.permit_all_parameters = true
    config.active_job.queue_adapter = :sidekiq




    config.i18n.default_locale = :en
    config.i18n.available_locales = [:en, :de]
    config.i18n.fallbacks =[:en]

    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '*',
                 :headers => :any,
                 :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client'],
                 :methods => [:get, :post, :options, :delete, :put]
      end
    end
  end
end
